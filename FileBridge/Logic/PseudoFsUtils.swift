//
//  PseudoFsUtils.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/17/21.
//

import Foundation

enum PseudoFsError: Error {
    case invalidDirectory
    case wrappedError(error: Error)
}

class PseudoFsUtils: FileUtils {
    var documentsDirectory: URL
    var appDirectory: URL = FileUtils.getAppDirectory()
    var isImporting: Bool = false
    var isExporting: Bool = false
    var isMoving: Bool = false
    
    init(_ documentsDirectory: URL, _ isImporting: Bool, _ isExporting: Bool, _ isMoving: Bool) {
        self.documentsDirectory = documentsDirectory
        self.isImporting = isImporting
        self.isExporting = isExporting
        self.isMoving = isMoving
    }
    
    // Check if we can access the scoped resource
    func prepCopying() throws {
        let checkString: String?

        do {
            checkString = try StringRenderer().getCutString(input: documentsDirectory.absoluteString)
        }
        catch {
            throw StringRendererError.noPercentRemoval
        }

        if checkString != "File Provider Storage" {
            throw PseudoFsError.invalidDirectory
        }
        
        if documentsDirectory.startAccessingSecurityScopedResource() {
            defer { documentsDirectory.stopAccessingSecurityScopedResource() }
            
            let src = isImporting ? documentsDirectory : appDirectory
            let dest = isImporting ? appDirectory : documentsDirectory
            
            let cutString = isImporting ? checkString! : "Documents"
            
            switch copyIphoneDirectory(src: src, dest: dest, cutString: cutString) {
            case .success(()):
                return
            case .failure(let error):
                throw PseudoFsError.wrappedError(error: error)
            }
        }
    }
    
    // Copy or move the files within the directory to the app directory or vice versa
    private func copyIphoneDirectory(src: URL, dest: URL, cutString: String) -> Result<Void, Error> {
        let fileManager = FileManager.default

        do {
            let urls = try fileManager.contentsOfDirectory(at: src, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for url in urls {
                guard let urlNoPercent = url.absoluteString.removingPercentEncoding else {
                    throw StringRendererError.noPercentRemoval
                }

                if let range = urlNoPercent.range(of: cutString) {
                    let cutUrl = String(urlNoPercent[range.upperBound...])
                    let newUrl = dest.appendingPathComponent(cutUrl)

                    // To avoid file already exists error
                    try? fileManager.removeItem(at: newUrl)

                    if isMoving {
                        try fileManager.moveItem(at: url, to: newUrl)
                    } else {
                        try fileManager.copyItem(at: url, to: newUrl)
                    }
                    
                    // Make the FileBridge folder show up again
                    if isExporting && isMoving {
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
