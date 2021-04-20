//
//  Utils.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/2/21.
//

import Foundation

class InitUtils {
    // If the app is opened for the first time
    func checkFirstRun(defaults: UserDefaults) {
        if !defaults.bool(forKey: "appLaunchedOnce") {
            FileUtils().addEmptyText()

            defaults.set(true, forKey: "appLaunchedOnce")
        }
    }
}
