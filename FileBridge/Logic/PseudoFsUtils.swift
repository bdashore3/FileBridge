//
//  PseudoFsUtils.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/17/21.
//

import Foundation

enum PseudoFsError: Error {
    case invalidDirectory
    case noFilesProvided
    case wrappedError(error: Error)
}

// PseudoFS utilities
class PseudoFsUtils: FileUtils {
    // Init variables used in the entire class
    var documentsDirectory: URL
    var appDirectory: URL = FileUtils.getAppDirectory()
    var isImporting: Bool = false
    var isCopying: Bool = false
    
    init(_ documentsDirectory: URL, _ isImporting: Bool, _ isCopying: Bool) {
        self.documentsDirectory = documentsDirectory
        self.isImporting = isImporting
        self.isCopying = isCopying
    }
    
    // Check if we can access the scoped resource
    func prepCopying() throws {
        let checkString: String?

        do {
            checkString = try StringRenderer().getCheckString(input: documentsDirectory.absoluteString)
        }
        catch {
            throw StringRendererError.noPercentRemoval
        }

        // Are we in "On my iPhone"?
        if checkString != "File Provider Storage" {
            throw PseudoFsError.invalidDirectory
        }
        
        if documentsDirectory.startAccessingSecurityScopedResource() {
            // Stop accessing the scoped resource even on error
            defer { documentsDirectory.stopAccessingSecurityScopedResource() }
            
            // Set a generic source and destination
            let src = isImporting ? documentsDirectory : appDirectory
            let dest = isImporting ? appDirectory : documentsDirectory
            
            let cutString = isImporting ? checkString! : "Documents"
            
            switch copyIphoneDirectory(src, dest, cutString) {
            case .success(()):
                return
            case .failure(let error):
                throw PseudoFsError.wrappedError(error: error)
            }
        }
    }
    
    // Copy or move the files within the directory to the app directory or vice versa
    private func copyIphoneDirectory(_ src: URL, _ dest: URL, _ cutString: String) -> Result<Void, Error> {
        let fileManager = FileManager.default

        do {
            let urls = try fileManager.contentsOfDirectory(at: src, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            if urls.isEmpty {
                throw PseudoFsError.noFilesProvided
            }
            
            for url in urls {
                guard let urlNoPercent = url.absoluteString.removingPercentEncoding else {
                    throw StringRendererError.noPercentRemoval
                }

                if let range = urlNoPercent.range(of: cutString) {
                    let cutUrl = String(urlNoPercent[range.upperBound...])
                    let newUrl = dest.appendingPathComponent(cutUrl)
                    
                    if cutUrl == "/doNotDelete.txt" {
                        continue
                    }
                    
                    // To avoid file already exists error
                    try? fileManager.removeItem(at: newUrl)

                    if isCopying && isImporting {
                        try fileManager.copyItem(at: url, to: newUrl)
                    } else {
                        try fileManager.moveItem(at: url, to: newUrl)
                    }

                    // Make the FileBridge folder show up again
                    if !isImporting && !isCopying {
                        addEmptyText()
                    }
                }
            }
        }
        catch {
            // Return and throw an error
            print("Error when transferring files: \(error)")
            
            return .failure(error)
        }
        
        return .success(())
    }
}
