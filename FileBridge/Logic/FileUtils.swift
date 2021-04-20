//
//  FileUtils.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/15/21.
//

import Foundation

class FileUtils {
    // Utility function to fetch the app documents directory
    public static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // Add an empty text document to show the folder
    func addEmptyText() {
        let str = "Do not delete this file!"

        let url = FileUtils.getDocumentsDirectory().appendingPathComponent("doNotDelete.txt")
        
        do {
            try str.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            print(error.localizedDescription)
        }
    }
}
