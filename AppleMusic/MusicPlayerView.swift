//
//  MusicPlayerView.swift
//  AppleMusic
//
//  Created by Gabriele Esposito on 20/11/23.
//

import SwiftUI
import AVKit
import AVFoundation

struct MusicPlayerView: View {
    @State private var player = AVQueuePlayer()
        @State private var songTitle = "Not Playing"
        @State private var duration = CMTime.zero
        @State private var isPlaying = false
        
        var body: some View {
            VStack {
                Text(songTitle)
                    .font(.title)
                    .padding()
                
                Slider(value: $player.currentTime().seconds, in: 0...duration.seconds, step: 1)
                    .padding()
                
                Button(action: {
                    if isPlaying {
                        player.pause()
                    } else {
                        player.play()
                    }
                    isPlaying.toggle()
                }) {
                    Text(isPlaying ? "Pause" : "Play")
                        .font(.title)
                        .padding()
                }
                
                Button(action: {
                    player.stop()
                }) {
                    Text("Stop")
                        .font(.title)
                        .padding()
                }
            }
            .onAppear {
                let audioPath = Bundle.main.path(forResource: "song", ofType: "mp3")!
                let audioUrl = URL(fileURLWithPath: audioPath)
                let audioAsset = AVAsset(url: audioUrl)
                let audioItem = AVPlayerItem(asset: audioAsset)
                
                player = AVQueuePlayer(playerItem: audioItem)
                songTitle = "Playing Song"
                duration = audioAsset.duration
            }
        }
    }

    struct ContentView: View {
        var body: some View {
            MusicPlayerView()
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
