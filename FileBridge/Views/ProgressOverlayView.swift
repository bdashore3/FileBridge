//
//  PseudoFsParentView.swift
//  FileBridge
//
//  Created by Brian Dashore on 4/19/21.
//

import SwiftUI

struct ProgressOverlayView: View {
    @Binding var isShowing: Bool
    
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

struct PseudoFsParentView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressOverlayView(isShowing: .constant(false))
    }
}
