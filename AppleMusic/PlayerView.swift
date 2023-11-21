//
//  PlayerView.swift
//  AppleMusic
//
//  Created by Gabriele Esposito on 14/11/23.
//

import SwiftUI
import AVKit

struct PlayerView: View {
    
    var song : Songs
    @State private var volume: Double = 0
    private let range: ClosedRange<Double> = 0...100
    
    var body: some View {
        VStack {
            Spacer()
            Image(song.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250)
                .cornerRadius(13)
                .padding(.bottom)
                .offset(y: -80) // Sposta l'immagine sopra il centro

            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(song.title)
                            .bold()
                            .font(.system(size: 20))
                        Text(song.artist)
                            .opacity(0.8)
                            .font(.system(size: 20))
                    }
                    Spacer()
                    Image(systemName: "ellipsis.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                }
                .padding(.leading)
                .padding(.trailing)
                .offset(y: -20)
                
                HStack {
                    Spacer()
                    Slider(value: $volume, in: range)
                    Spacer()
                }

                HStack {
                    Spacer()
                    Image(systemName: "backward.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                    Spacer()
                    Image(systemName: "play.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35)
                    Spacer()
                    Image(systemName: "forward.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                    Spacer()
                }
                .padding(.leading)
                .padding(.trailing)
                .offset(y: 60)

                HStack {
                    Image(systemName: "speaker.fill")
                    Slider(value: $volume, in: range)
                    Image(systemName: "speaker.wave.3.fill")
                }
                .padding(.leading)
                .padding(.trailing)
                .offset(y: 110)

                HStack {
                    Spacer()
                    Image(systemName: "quote.bubble")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25)
                    Spacer()
                    Image(systemName: "airplayaudio")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25)
                    Spacer()
                    Image(systemName: "list.bullet")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25)
                    Spacer()
                }
                .offset(y: 150)
            }
            Spacer() // Aggiungi uno Spacer aggiuntivo alla fine
        }
    }
}


#Preview {
    PlayerView(song: Songs(title: "Prova1", image: "Prova", artist: "Prova"))
}
