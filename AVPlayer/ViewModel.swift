//
//  ViewModel.swift
//  AVPlayer
//
//  Created by Long Sen on 7/18/22.
//

import Combine
import AVFoundation

class PlayerItemObserver: ObservableObject {

    private var cancellable: AnyCancellable?
    private var timer = Timer()

    init(player: AVPlayer) {
        cancellable = player.publisher(for: \.rate).sink(receiveValue: { status in
            if status == 0.0 {
                print("stop")
                self.timer.invalidate()
            } else {
                print("play")
                self.timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                    print("Current Playhead position: \(player.currentTime().durationText)")
            }
            }
        })
    }
}

extension CMTime {
    var durationText:String {
        let totalSeconds = Int(CMTimeGetSeconds(self))
        let hours:Int = Int(totalSeconds / 3600)
        let minutes:Int = Int(totalSeconds % 3600 / 60)
        let seconds:Int = Int((totalSeconds % 3600) % 60)

        if hours > 0 {
            return String(format: "%i:%02i:%02i", hours, minutes, seconds)
        } else {
            return String(format: "%02i:%02i", minutes, seconds)
        }
    }
}
