//
//  ViewExtensions.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/25/21.
//

import Foundation
import SwiftUI

// Used for fetching the version string of the app
extension UIApplication {
    class func appVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
  
    class func appBuild() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    }
}
