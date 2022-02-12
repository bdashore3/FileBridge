//
//  DisclaimerView.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/25/21.
//

import SwiftUI

struct DisclaimerView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var isTapped = false

    var body: some View {
        VStack {
            Text("Disclaimer")
                .padding()
                .foregroundColor(.red)
                .font(.largeTitle)

            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text("This application contains a feature called PseudoFS which directly interacts with your filesystem.")

                    Text("I have put many safeguards which protect your data and I also give you multiple warnings to not uninstall the app if you turn off those safety features.")

                    Text("Therefore, I am not responsible if you end up losing your data because you forget to read the provided warnings on the app. Please do not complain to me if you do not listen to the app's safeguards.")

                    Text("This disclaimer is not made to worry you, feel free to turn off the safeguards. Just make sure to NOT UNINSTALL THE APP before restoring your data and you'll be fine.")

                    Text("- Brian")

                    Spacer()
                }
                .padding()
                .font(.body)
            }

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

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerView()
    }
}
