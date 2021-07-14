//
//  HowToPseudoFSView.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/29/21.
//

import SwiftUI

struct HowToPseudoFSImportView: View {
    @State private var showSheet = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("This guide is for enabling the PseudoFS feature. Please read the entire article.")
                
                Button {
                    showSheet = true
                } label: {
                    ListRowTextView(leftText: "Disclaimer", rightText: nil, rightSymbol: "chevron.right")
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
                    DisclaimerView()
                })
                
                Text("Here are the steps:")
                
                NumberedListView([
                    "Enter the PseudoFS tab",
                    "Determine whether to keep the safe copying toggle on or off (See the below notes)",
                    "Click import",
                    "Follow the alert prompts",
                    "Wait for the copying to finish",
                    "The operation was sucessful if you see a success alert",
                    "Look at other guides for reorganizing your filesystem and working with PseudoFS",
                ])

                
                Text("About safe copying:")
                
                BulletedListView([
                    "This copies your files from the \"On my iPhone\" directory to FileBridge. If you accidentally uninstall the app with PseudoFS on, all of the imported files will be safe",
                    "Turning this switch off is perfectly fine. Just make sure not to uninstall the app when PseudoFS is enabled!",
                ])
                
                Text("Here's a video for the process in action when the copy switch is on:")
                
                VideoView(urlInput: "https://files.kingbri.dev/.public-app-assets/FileBridge/PseudoFS-import-copy.mp4")
                
                Text("Importing when the copy switch is off:")
                    .padding(.top)
                
                VideoView(urlInput: "https://files.kingbri.dev/.public-app-assets/FileBridge/PseudoFS-import-move.mp4")
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .navigationTitle("PseudoFS Importing")
        }
    }
}

struct HowToPseudoFsRestoreView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("This guide is for restoring the PseudoFS feature. Please read the notes.")
                    
                Text("Here are the steps:")
                    
                NumberedListView([
                    "Enter the PseudoFS tab",
                    "Click restore",
                    "Follow the alert prompts",
                    "Wait for the movement to finish",
                    "The operation was sucessful if you see a success alert",
                ])
                
                Text("Important Notes:")
                
                BulletedListView([
                    "The safe copying toggle is off because your files are moved from FileBridge to the \"On my iPhone\" directory. This is normal behavior",
                    "The restore action will overwrite any files that exist in the \"On my iPhone\" directory with the matching ones from FileBridge"
                ])
                
                Text("Here's a video for the process in action:")
                
                VideoView(urlInput: "https://files.kingbri.dev/.public-app-assets/FileBridge/PseudoFS-restore.mp4")
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .navigationTitle("PseudoFS Restore")
        }
    }
}

struct HowToPseudoFSView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPseudoFSImportView()
        HowToPseudoFsRestoreView()
    }
}
