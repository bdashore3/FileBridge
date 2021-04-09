//
//  Utils.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/2/21.
//

import Foundation


// Fetches the App's documents
public func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

// If the app is opened for the first time
public func checkFirstRun(defaults: UserDefaults) {
    if !defaults.bool(forKey: "appLaunchedOnce") {
        addEmptyText()

        defaults.set(true, forKey: "appLaunchedOnce")
    }
}

// Add an empty text document to show the folder
public func addEmptyText() {
    let str = "Do not delete this file!"
    let url = getDocumentsDirectory().appendingPathComponent("doNotDelete.txt")
    
    do {
        try str.write(to: url, atomically: true, encoding: .utf8)
    } catch {
        print(error.localizedDescription)
    }
}
