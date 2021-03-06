//
//  FileBridgeApp.swift
//  FileBridge
//
//  Created by Brian Dashore on 3/31/21.
//

import SwiftUI

@main
struct FileBridgeApp: App {
    init() {
        let defaults = UserDefaults.standard;

        InitUtils().checkFirstRun(defaults: defaults)
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
