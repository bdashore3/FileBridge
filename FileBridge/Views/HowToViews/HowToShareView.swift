//
//  SharingFilesView.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/29/21.
//

import SwiftUI

struct HowToShareView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("This guide is for transferring a single file through FileBridge onto iTunes or Finder on Mac")
                    
                Text("Here are the steps:")
                    
                NumberedListView([
                    "Open Files",
                    "Hold the file/folder you want to move and select the move button",
                    "On the popup, select the FileBridge folder and click done",
                    "Connect a cable to your PC/Mac",
                    "On iTunes/Finder, navigate to your phone and select File Sharing/Files",
                    "Drag and drop the file/folder anywhere inside your PC file explorer",
                ])
                
                Text("Here's a video for the process in action:")
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .navigationTitle("Transfer")
        }
    }
}

struct HowToShareSheetView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HowToShareView()
            
            Spacer()

            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .font(.title3)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
                    .opacity(0.2)
            )
            
            Spacer(minLength: 30)
        }
    }
}

struct HowToShareView_Previews: PreviewProvider {
    static var previews: some View {
        HowToShareView()
    }
}
