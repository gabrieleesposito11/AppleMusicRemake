//
//  SongsViewModel.swift
//  AppleMusic
//
//  Created by Gabriele Esposito on 14/11/23.
//

import Foundation
import Observation

@Observable class SongsViewModel{
    var song : [Songs] = [
        
        Songs(title: "Indie Happy Rock", image: "Upbeat Indie Happy Rock", artist: "Infraction"),
        Songs(title: "Funk Fashion", image: "Funk Fashion", artist: "Infraction"),
        Songs(title: "Fashion Saxophone", image: "Fashion Saxophone", artist: "Infraction"),
        Songs(title: "Hip-Hop Energy", image: "Hip-Hop Energy", artist: "Infraction"),
        Songs(title: "Time Of Our Lives", image: "Time Of Our Lives", artist: "NCS"),
        Songs(title: "Funk Fun Happy", image: "Funk Fun Happy", artist: "Infraction")
    ]
    
    var currentSong = Songs(title: "Nessuna riproduzione", image: "default", artist: "")
}

var datas = SongsViewModel()
