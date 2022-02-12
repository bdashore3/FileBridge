//
//  StringRenderer.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/17/21.
//

import Foundation

enum StringRendererError: Error {
    case noPercentRemoval
}

class StringRenderer {
    // Fetches the last word from a file path and returns it for checking
    func getCheckString(input: String) throws -> String {
        var inputArray = input.components(separatedBy: "/")
        inputArray.removeAll(where: { $0 == "" })

        guard let cutString = inputArray.last!.removingPercentEncoding else {
            throw StringRendererError.noPercentRemoval
        }

        return cutString
    }
}
