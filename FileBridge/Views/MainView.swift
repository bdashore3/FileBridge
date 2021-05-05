//
//  MainView.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/12/21.
//

import SwiftUI

enum Tab {
    case home
    case pseudofs
    case howto
    case about
}

struct MainView: View {
    @State var tabSelection: Tab = .home
    @State var showProgressView = false
    
    // Shows tabs on bottom of the screen
    var body: some View {
        TabView(selection: $tabSelection) {
            ContentView(tab: $tabSelection)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)
            PseudoFsView(showProgressView: $showProgressView)
                .tabItem {
                    Label("PseudoFS", systemImage: "folder")
                }
                .tag(Tab.pseudofs)
            HowToView()
                .tabItem {
                    Label("Guides", systemImage: "book")
                }
                .tag(Tab.howto)
            AboutView()
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
                .tag(Tab.about)
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
