//
//  HowToRegen.swift
//  FileBridge
//
//  Created by Brian Dashore on 5/3/21.
//

import SwiftUI

struct HowToRegenView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("This guide is regenerate the FileBridge folder if it accidentally disappears in the Files app.")
                    
                Text("Here are the steps:")
                    
                NumberedListView([
                    "Open FileBridge",
                    "Click the \"Recover Folder\" button",
                    "Follow the alerts",
                    "Check the Files app",
                    "The FileBridge folder should appear",
                ])
                
                Text("Important note:")
                
                BulletedListView([
                    "The FileBridge folder may not appear",
                    "To make it appear, just exit out of the \"On my iPhone\" directory and go back in",
                    "The folder should show up since you refreshed the view",
                    "You can also force close and reopen the Files app and the folder should show up"
                ])
                
                Text("Here's a video for the process in action:")
                
                VideoView(urlInput: "https://files.kingbri.me/app-assets/FileBridge/Regen-FileBridge.mp4")
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .navigationTitle("Safari")
        }
    }
}

struct HowToRegenView_Previews: PreviewProvider {
    static var previews: some View {
        HowToRegenView()
    }
}
