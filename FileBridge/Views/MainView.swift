//
//  MainView.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/12/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            PseudoFsView()
                .tabItem {
                    Label("Pseudo-FS", systemImage: "folder")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
