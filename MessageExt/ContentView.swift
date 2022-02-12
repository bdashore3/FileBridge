//
//  ContentView.swift
//  MessageExt
//
//  Created by Brian Dashore on 2/11/22.
//

import Messages
import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        Button("Attach files") {
            viewModel.showFileImporter.toggle()
        }
        .alert(isPresented: $viewModel.showErrorAlert) {
            Alert(
                title: Text("Error!"),
                message: Text(viewModel.errorDescription),
                dismissButton: .default(Text("OK"))
            )
        }
        .fileImporter(isPresented: $viewModel.showFileImporter, allowedContentTypes: [UTType.data]) { result in
            switch result {
            case let .success(path):
                Task {
                    await viewModel.attachToMessage(path: path)
                }
            case let .failure(error):
                debugPrint("FileImporter error!: \(error)")

                Task {
                    await viewModel.showError(description: error.localizedDescription)
                }
            }
        }
        .onAppear {
            viewModel.showFileImporter.toggle()
        }
    }
}
