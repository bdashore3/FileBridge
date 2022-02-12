//
//  VideoView.swift
//  FileBridge
//
//  Created by Brian Dashore on 5/2/21.
//

import AVKit
import SwiftUI

struct VideoView: View {
    private var urlInput: String

    init(urlInput: String) {
        self.urlInput = urlInput
    }

    var body: some View {
        let player = fetchVideoPlayer(input: urlInput)

        VideoPlayer(player: player)
            .onDisappear {
                player.pause()
            }
            .ignoresSafeArea()
            .aspectRatio(contentMode: .fit)
    }

    func fetchVideoPlayer(input: String) -> AVPlayer {
        AVPlayer(url: URL(string: input)!)
    }
}
