//
//  HowToView.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/26/21.
//

import SwiftUI

struct HowToView: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("How-to guides")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.blue)
                        
                    Text("Since this app may be a bit complicated to use, I have made some in-app guides on situations and features for file transfer. Enjoy!")
                        .padding()
                }

                List {
                    NavigationLink(destination: HowToShareView()) {
                        Text("General file transfer")
                    }
                    
                    NavigationLink(destination: HowToPseudoFSImportView()) {
                        Text("PseudoFS import guide")
                    }
                    
                    NavigationLink(destination: HowToPseudoFsRestoreView()) {
                        Text("PseudoFS restore guide")
                    }
                    
                    NavigationLink(destination: HowToPhotosView()) {
                        Text("Photo migration")
                    }
                    
                    NavigationLink(destination: HowToSafariView()) {
                        Text("Change Safari download location")
                    }
                }
                .listStyle(InsetListStyle())
            }
            .navigationTitle("How-to")
            .navigationBarHidden(true)
        }
    }
}

struct HowToView_Previews: PreviewProvider {
    static var previews: some View {
        HowToView()
    }
}
