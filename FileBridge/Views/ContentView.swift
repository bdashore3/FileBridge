//
//  ContentView.swift
//  FileBridge
//
//  Created by Brian Dashore on 3/31/21.
//

import SwiftUI

struct ContentView: View {
    @Binding var tab: Tab

    @State private var showAlert = false

    // First page view
    var body: some View {
        VStack {
            HStack {
                Text("Welcome to")
                Text("FileBridge")
                    .foregroundColor(.blue)
            }
            .font(.largeTitle)
            .padding()

            Text("This app allows you to easily transfer files with nothing but a lightning cable and iTunes or Finder.")
                .padding()
                .font(.title2)
                .multilineTextAlignment(.center)

            Spacer()

            Text("Getting Started or need help?")
                .font(.title2)

            Button {
                tab = Tab.howto
            } label: {
                ListRowTextView(leftText: "Check the tutorial guides", rightText: nil, rightSymbol: "chevron.right")
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
            .padding()

            Spacer()

            VStack(alignment: .center) {
                Text("Missing the FileBridge folder in files?")
                Text("Click the button.")
            }
            Button {
                FileUtils().addEmptyText()

                showAlert = true
            } label: {
                Text("Recover folder")
                    .padding(20)
                    .foregroundColor(.blue)
                    .font(.title3)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Folder regenerated"),
                    message: Text("Check your files app. \n\n Your FileBridge folder should have reappeared."),
                    dismissButton: .default(Text("Got it!"))
                )
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
                    .opacity(0.2)
            )
            .padding(.bottom, 30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tab: .constant(Tab.home))
    }
}
