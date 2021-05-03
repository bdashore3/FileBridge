//
//  PseudoFsParentView.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/19/21.
//

import SwiftUI

struct ProgressOverlayView: View {
    @Binding var isShowing: Bool
    
    // Show a progress view that blocks all UI elements
    var body: some View {
        ZStack {
            if isShowing {
                Color(UIColor.systemBackground)
                    .ignoresSafeArea()
                    .opacity(0.75)
                
                VStack {
                    ProgressView()
                        .scaleEffect(2.0, anchor: .center)
                    Text("Working")
                        .padding(.top)
                        .font(.title3)
                }
            }
        }
    }
}
