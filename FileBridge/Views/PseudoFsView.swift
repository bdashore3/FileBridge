//
//  PseudoFsView.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/12/21.
//

import SwiftUI
import UniformTypeIdentifiers

struct PseudoFsView: View {
    @State private var isImporting = false
    @State private var isExporting = false
    @State private var isMoving = false
    
    static let fileUtils = FileUtils()
    
    var body: some View {
        VStack {
            Toggle(isOn: $isMoving) {
                Text("Move my files")
            }
            
            Button("Import") {
                isImporting = true
            }
            .fileImporter(
                isPresented: $isImporting,
                allowedContentTypes: [.folder],
                allowsMultipleSelection: false
            ) { result in
                switch result {
                case .failure(let error):
                    print("Error selecting file: \(error.localizedDescription)")
                case .success(let urls):
                    let src = urls[0]
                    let dest = getDocumentsDirectory()
                    
                    if src.startAccessingSecurityScopedResource() {
                        defer { src.stopAccessingSecurityScopedResource() }

                        print("Accessing scoped resource")
                        
                        PseudoFsView.fileUtils.copyIphoneDirectory(src: src, dest: dest, cutString: "File Provider Storage", isMoving: isMoving)
                    } else {
                        print("Can't access scoped resource!")
                    }
                    
                    print("Function completed")
                }
            }
            
            Button("Restore") {
                isExporting = true
            }
            .fileImporter(
                isPresented: $isExporting,
                allowedContentTypes: [.folder],
                allowsMultipleSelection: false
            ) { result in
                switch result {
                case .failure(let error):
                    print("Error selecting file: \(error.localizedDescription)")
                case .success(let urls):
                    let src = getDocumentsDirectory()
                    let dest = urls[0]

                    if dest.startAccessingSecurityScopedResource() {
                        defer { src.stopAccessingSecurityScopedResource() }
                        
                        PseudoFsView.fileUtils.copyIphoneDirectory(src: src, dest: dest, cutString: "Documents", isMoving: isMoving)
                    }

                }
            }
        }
    }
}

struct PseudoFsView_Previews: PreviewProvider {
    static var previews: some View {
        PseudoFsView()
    }
}
