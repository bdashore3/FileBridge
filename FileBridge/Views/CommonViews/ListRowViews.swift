//
//  CommonViews.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/25/21.
//

import SwiftUI

// View alias for a list row with an external link
struct ListRowLinkView: View {
    let text: String
    let link: String

    var body: some View {
        HStack {
            Link(text, destination: URL(string: link)!)
                .foregroundColor(.primary)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
    }
}

struct ListRowTextView: View {
    let leftText: String
    var rightText: String?
    var rightSymbol: String?

    var body: some View {
        HStack {
            Text(leftText)

            Spacer()

            if let rightText = rightText {
                Text(rightText)
            } else {
                Image(systemName: rightSymbol!)
                    .foregroundColor(.gray)
            }
        }
    }
}
