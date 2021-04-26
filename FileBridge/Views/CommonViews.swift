//
//  CommonViews.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/25/21.
//

import SwiftUI

// View alias for a list row with an external link
struct ListRowLinkView: View {
    private var text: String
    private var link: URL
    
    init(displayText: String, innerLink: String) {
        link = URL(string: innerLink)!
        text = displayText
    }
    
    var body: some View {
        HStack {
            Link(text, destination: link)
                .foregroundColor(Color.primary)
                
            Spacer()
                
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
    }
}

struct ListRowTextView: View {
    private var leftText: String
    private var rightText: String
    
    init(leftText: String, rightText: String) {
        self.leftText = leftText
        self.rightText = rightText
    }
    
    var body: some View {
        HStack {
            Text(leftText)
                
            Spacer()
                
            Text(rightText)
        }
    }
}
