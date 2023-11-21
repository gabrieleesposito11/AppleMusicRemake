//
//  PlayerView.swift
//  AppleMusic
//
//  Created by Gabriele Esposito on 14/11/23.
//

import SwiftUI

struct SongsView: View {
    
    var song = SongsViewModel()
    @State private var searchText = ""
    @State private var currentSong : String?
    
    var body: some View {
        NavigationStack{
            List {
                HStack {
                    Spacer()
                    HStack{
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 160, height: 55)
                                .foregroundColor(.gray)
                                .opacity(0.2)
                            HStack{
                                Image(systemName: "play.fill")
                                    .foregroundColor(.red)
                                    .bold()
                                Text("Play")
                                    .foregroundStyle(.red)
                                    .bold()
                            }
                        }
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 160, height: 55)
                                .foregroundColor(.gray)
                                .opacity(0.2)
                            HStack{
                                Image(systemName: "shuffle")
                                    .foregroundColor(.red)
                                    .bold()
                                Text("Shuffle")
                                    .foregroundColor(.red)
                                    .bold()
                            }
                        }
                    }
                    Spacer()
                }
                ForEach(song.song){ canzone in
                    NavigationLink(destination: NewPlayerView(song: canzone, expandSheet: .constant(true), animation: Namespace().wrappedValue)) {
                        HStack {
                            Image(canzone.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:50)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            VStack (alignment: .leading){
                                Text(canzone.title).font(.title3)
                                Text(canzone.artist)
                                    .opacity(0.5)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Songs")
            .listStyle(.plain)
        }
        .searchable(text: $searchText, prompt: "Find in Songs")
    }
}

#Preview {
    SongsView()
}
