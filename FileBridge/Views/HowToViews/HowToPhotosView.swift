//
//  MovePhotosView.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/29/21.
//

import SwiftUI

struct HowToPhotosView: View {
    @State private var showSheet = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("This guide is for transferring a single photo or video in its original quality.")
                    
                Text("Here are the steps:")
                    
                NumberedListView([
                    "Open the photos app",
                    "Open the photo/video you want to transfer",
                    "Click the share button",
                    "Select Save to files",
                    "In the popup, select FileBridge",
                    "Follow the copy general files tutorial and copy the photo just like any other file",
                ])
                
                Button {
                    showSheet = true
                } label: {
                    ListRowTextView(leftText: "General files tutorial", rightText: nil, rightSymbol: "chevron.right")
                        .foregroundColor(.primary)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 13)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.gray)
                        .opacity(0.2)
                )
                .frame(maxWidth: .infinity, alignment: .center)
                .sheet(isPresented: $showSheet, content: {
                    HowToShareSheetView()
                })
                
                Text("Here's a video for the process in action:")
                
                VideoView(urlInput: "https://files.kingbri.dev/.public-app-assets/FileBridge/Photo-share.mp4")

                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .navigationTitle("Photos")
        }
    }
}

struct HowToPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPhotosView()
    }
}
