//
//  HowToSafariView.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/28/21.
//

import AVKit
import SwiftUI

struct HowToSafariView: View {
    private let player = AVPlayer(url: URL(string: "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4")!)
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("This guide is to change the download location for Safari.")
                    
                Text("Here are the steps:")
                    
                NumberedListView([
                    "Open settings",
                    "Navigate to the Safari menu",
                    "Click the Downloads option",
                    "Select other",
                    "In the popup, select the FileBridge folder",
                    "If there is no Downloads folder in FileBridge, click the new folder icon and make a new one",
                    "Select done",
                    "Exit settings"
                ])
                
                
                Text("Here's a video for the process in action:")
                
                VideoView(urlInput: "https://files.kingbri.dev/.public-app-assets/FileBridge/Safari-downloads.mp4")
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .navigationTitle("Safari")
        }
    }
}

struct HowToSafariView_Previews: PreviewProvider {
    static var previews: some View {
        HowToSafariView()
    }
}
