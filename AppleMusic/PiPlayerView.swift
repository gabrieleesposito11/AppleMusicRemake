//
//  PiPlayerView.swift
//  AppleMusic
//
//  Created by Gabriele Esposito on 16/11/23.
//

import SwiftUI

struct PiPlayerView: View {
    
    var song : Songs
    
    var body: some View {
            VStack {
                HStack {
                    Image(song.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44)
                        .cornerRadius(2)
                        .offset(x: -70, y: 2)
                    Text(song.title)
                        .multilineTextAlignment(.leading)
                        .frame(minWidth: 10,maxWidth: 80)
                        .offset(x: -65, y: -2)
                        .bold()
                    Image(systemName: "play.fill")
                        .font(.title)
                        .offset(x: 50, y: 2)
                    
                    Image(systemName: "forward.fill")
                        .font(.title)
                        .offset(x: 60, y: 2)
                }
                
            }
            //.position(x: 185, y: 350)
            .frame(maxWidth: 365, maxHeight: 40)
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .frame(width: 365)
                    .shadow(radius: 10)
                    .blur(radius: 1)
                //.position(x: 190, y: 360)
                
            )
        }
    }


    #Preview {
        PiPlayerView(song: Songs(title: "Indie Happy Rock", image: "Upbeat Indie Happy Rock", artist: "Infraction"))
    }
