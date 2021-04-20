//
//  MainView.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/12/21.
//

import SwiftUI

struct MainView: View {
    @State var showProgressView = false
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            PseudoFsView(showProgressView: $showProgressView)
                .tabItem {
                    Label("Pseudo-FS", systemImage: "folder")
                }
        }
        .blur(radius: showProgressView ? 2 : 0)
        .overlay(ProgressOverlayView(isShowing: $showProgressView))
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
