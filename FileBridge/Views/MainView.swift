//
//  MainView.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/12/21.
//

import SwiftUI

struct MainView: View {
    @State var showProgressView = false

    // Shows tabs on bottom of the screen
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            PseudoFsView(showProgressView: $showProgressView)
                .tabItem {
                    Label("PseudoFS", systemImage: "folder")
                }
            AboutView()
                .tabItem {
                    Label("About", systemImage: "info.circle")
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
