//
//  FileUtils.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/15/21.
//

import Foundation

enum FileUtilsError: Error {
    case noPercentRemoval
    case notValidDirectory
}

public func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

class FileUtils {    
    func copyIphoneDirectory(src: URL, dest: URL, cutString: String, isMoving: Bool) {
        print("Moving files state: \(isMoving)")
        
        let fileManager = FileManager.default

        do {
            let urls = try fileManager.contentsOfDirectory(at: src, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)

            for url in urls {
                guard let urlNoPercent = url.absoluteString.removingPercentEncoding else {
                    throw FileUtilsError.noPercentRemoval
                }
                
                if let range = urlNoPercent.range(of: cutString) {
                    let newUrl = String(urlNoPercent[range.upperBound...])

                    if isMoving {
                        try fileManager.moveItem(at: url, to: dest.appendingPathComponent(newUrl))
                    } else {
                        try fileManager.copyItem(at: url, to: dest.appendingPathComponent(newUrl))
                    }
                }

            }
        }
        catch {
            print("There was an error: \(error)")
        }
    }
}
