//
//  ContentView.swift
//  AVPlayer
//
//  Created by Long Sen on 7/18/22.
//

import SwiftUI
import AVKit

struct ContentView: View {
    static let stringURL = "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_4x3/bipbop_4x3_variant.m3u8"
    static let player = AVPlayer(url: URL(string: stringURL)!)
    @ObservedObject var vm = PlayerItemObserver(player: player)

    var body: some View {
        VideoPlayer(player: Self.player)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
