//
//  PseudoFsView.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/12/21.
//

import SwiftUI
import UniformTypeIdentifiers

struct PseudoFsView: View {
    // Checks if the user is using PseudoFS
    @AppStorage("usingPseudoFs") var usingPseudoFs: Bool = false

    // Binds to MainView's state var
    @Binding var showProgressView: Bool

    // State vars to be passed to logic
    @State private var isImporting = false
    @State private var isCopying = true

    // State vars for UI elements
    @State private var showFileView = false
    @State private var showWarnAlert = false
    @State private var showMoveAlert = false
    @State private var showSuccessAlert = false
    @State private var showErrorSheet = false

    // If there's an error
    @State private var errorSheetString: String = "Nothing here yet"

    // View for PseudoFS
    var body: some View {
        VStack {
            Text("PseudoFS")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.blue)

            VStack(alignment: .leading, spacing: 15) {
                Text("This feature migrates your files to the FileBridge folder for even easier transfer.")

                Spacer()

                Text("To set up PseudoFS, please follow the instructions in the Guides tab.")

                BulletedListView([
                    "If the button says \"Import\", follow the import guide.",
                    "If the button says \"Restore\", follow the restoration guide."
                ])

                Spacer()
            }
            .padding()

            Toggle(isOn: $isCopying, label: {
                Text("Safely copy my files")
            })
            .onAppear {
                isCopying = usingPseudoFs ? false : true
            }
            .toggleStyle(SwitchToggleStyle(tint: .blue))
            .animation(.easeInOut, value: isCopying)
            .onChange(of: isCopying) { _ in
                if !isCopying, !usingPseudoFs {
                    showWarnAlert = true
                }
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .padding(.horizontal)
                    .foregroundColor(.gray)
                    .opacity(0.2)
            )
            .alert(isPresented: $showWarnAlert) {
                Alert(
                    title: Text("Are you sure?"),
                    message: Text("Please make sure to restore before uninstalling the app otherwise the FileBridge folder will be deleted!"),
                    primaryButton: .destructive(Text("Proceed")),
                    secondaryButton: .cancel {
                        isCopying = true
                    }
                )
            }
            .disabled(usingPseudoFs == true)

            Spacer(minLength: 20)

            // Dynamically switch between import and restore
            Button {
                showMoveAlert = true

                if !usingPseudoFs {
                    isImporting = true
                }
            } label: {
                Text(usingPseudoFs ? "Restore" : "Import")
            }
            .padding()
            .padding(.horizontal, 10)
            .foregroundColor(.blue)
            .font(.title3)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
                    .opacity(0.2)
            )
            .alert(isPresented: $showMoveAlert) {
                Alert(
                    title: Text("Instructions"),
                    message: Text("Choose the \"On my iphone\" directory on the next popup"),
                    dismissButton: .default(Text("Got it!")) {
                        showFileView = true
                    }
                )
            }

            Spacer()

            HStack {
                Text("PseudoFS is")
                Text(usingPseudoFs ? "Enabled" : "Disabled")
                    .fontWeight(.bold)
            }
            .padding(.top)
            .alert(isPresented: $showSuccessAlert) {
                Alert(
                    title: Text("Success"),
                    message: Text("Check the \(usingPseudoFs ? "FileBridge" : "\"On my iPhone\"") folder and you'll see your files!"),
                    dismissButton: .default(Text("Got it!"))
                )
            }

            Spacer(minLength: 30)
        }
        .actionSheet(isPresented: $showErrorSheet) {
            ActionSheet(
                title: Text("Error"),
                message: Text(errorSheetString),
                buttons: [.cancel()]
            )
        }
        .fileImporter(
            isPresented: $showFileView,
            allowedContentTypes: [.folder],
            allowsMultipleSelection: false
        ) { result in
            switch result {
            case let .failure(error):
                errorSheetString = error.localizedDescription
                showErrorSheet = true
            case let .success(urls):
                showProgressView = true

                let group = DispatchGroup()
                group.enter()

                DispatchQueue.global(qos: .userInitiated).async {
                    handleFileResult(urls: urls)

                    group.leave()
                }

                group.notify(queue: DispatchQueue.main) {
                    isImporting = false
                    isCopying = usingPseudoFs ? false : true
                }
            }
        }
    }

    func handleFileResult(urls: [URL]) {
        guard let documentsDirectory = urls.first else { return }

        let pseudoUtils = PseudoFsUtils(documentsDirectory, isImporting, isCopying)
        do {
            try pseudoUtils.prepCopying()

            sleep(2)
            showProgressView = false
            showSuccessAlert = true

            usingPseudoFs = isImporting ? true : false
        } catch {
            switch error {
            case PseudoFsError.invalidDirectory:
                errorSheetString = "Please select the On my iPhone directory!"
            case StringRendererError.noPercentRemoval:
                errorSheetString = "Something went wrong when creating the directory string. The error is below \n\n \(error)"
            default:
                errorSheetString = "The error is logged below \n\n \(error)"
            }

            sleep(2)
            showProgressView = false
            showErrorSheet = true
        }
    }
}

struct PseudoFsView_Previews: PreviewProvider {
    static var previews: some View {
        PseudoFsView(showProgressView: .constant(false))
    }
}
