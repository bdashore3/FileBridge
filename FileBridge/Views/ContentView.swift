//
//  ContentView.swift
//  FileBridge
//
//  Created by Brian Dashore on 3/31/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Welcome to")
                Text("FileBridge")
                    .foregroundColor(Color.blue)
            }
            .font(.largeTitle)
            .padding()

            VStack (alignment: .center, spacing: 20) {
                Spacer()
                
                Text("You can close this app")
                Text("Open your device in iTunes and navigate to File Sharing")
                
                Spacer()
            }
            .font(.body)
            .padding()
            
            VStack (spacing: 15) {
                Text("Missing the folder in files? Click the button.")
                Button {
                    FileUtils().addEmptyText()
                    
                    showAlert = true
                } label: {
                    Text("Recover folder")
                        .padding(20)
                        .foregroundColor(Color.blue)
                        .font(.title3)
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Folder regenerated"),
                        message: Text("Check your files app. \n\n Your FileBridge folder should have reappeared."),
                        dismissButton: .default(Text("Got it!")))
                }
                .background(
                    Rectangle()
                        .foregroundColor(.gray)
                        .opacity(0.2)
                )
                .cornerRadius(40)
            }
            
            Spacer(minLength: 50)
        }
        .multilineTextAlignment(.center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
