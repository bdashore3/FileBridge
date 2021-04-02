//
//  ContentView.swift
//  FileBridge
//
//  Created by Brian Dashore on 3/31/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome to FileBridge")
                .font(.title)
                .padding()
            VStack (alignment: .center, spacing: 20) {
                Text("You can close this app")
                Text("Open your device in iTunes and navigate to File Sharing")
            }
            .font(.subheadline)
            .padding()
        }
        .multilineTextAlignment(.center)
        .onAppear(perform: checkFirstRun)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
