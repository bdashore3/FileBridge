//
//  ExtraTextViews.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/28/21.
//

import SwiftUI

struct BulletedListView: View {
    private var inputStrings: [String]
    
    init(_ inputStrings: [String]) {
        self.inputStrings = inputStrings
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            ForEach(inputStrings, id: \.self) { string in
                HStack(alignment: .top) {
                    Text("\u{2022}")
                        .frame(width: 20, alignment: .topLeading)
                    Text(string)
                }
            }
        }
        .padding(.leading, 20)
        .padding(.vertical, 5)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct NumberedListView: View {
    private var inputStrings: [String]
    
    init(_ inputStrings: [String]) {
        self.inputStrings = inputStrings
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            ForEach(Array(zip(inputStrings.indices, inputStrings)), id: \.0) { index, string in
                HStack(alignment: .top) {
                    Text("\(index + 1).")
                        .frame(width: 20, alignment: .topLeading)
                    Text(string)
                }
            }
        }
        .padding(.leading, 20)
        .padding(.vertical, 5)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .fixedSize(horizontal: false, vertical: true)
    }
}
