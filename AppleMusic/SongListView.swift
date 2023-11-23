//
//  SongListView.swift
//  AppleMusic
//
//  Created by Gabriele Esposito on 22/11/23.
//

import SwiftUI

struct SongListView: View {
    
    var song = SongsViewModel()
    
    var body: some View {
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
}

#Preview {
    SongListView()
}
