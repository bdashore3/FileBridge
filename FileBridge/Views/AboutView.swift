//
//  AboutView.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/24/21.
//

import SwiftUI

struct AboutView: View {
    @State private var showDisclaimer = false
    
    var body: some View {
        VStack {
            Text("About")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.blue)
            
            Image("AppImage")
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(25)
            
            Text("FileBridge is a free and open source file transfer application developed by Brian Dashore under the Apache-2.0 license.")
                .padding()

            List {
                ListRowTextView(leftText: "Version", rightText: UIApplication.appVersion(), rightSymbol: nil)
                ListRowTextView(leftText: "Build Number", rightText: UIApplication.appBuild(), rightSymbol: nil)
                HStack {
                    Button("Disclaimer") {
                        showDisclaimer = true
                    }
                    .foregroundColor(.primary)
                    .sheet(isPresented: $showDisclaimer) {
                        DisclaimerView()
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                ListRowLinkView(displayText: "GitHub Repository", innerLink: "https://github.com/bdashore3/FileBridge")
                ListRowLinkView(displayText: "Discord Support", innerLink: "https://discord.gg/pswt7by")
            }
            .listStyle(InsetGroupedListStyle())
            
            Spacer()
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
