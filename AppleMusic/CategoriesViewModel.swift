//
//  CategoriesViewModel.swift
//  AppleMusic
//
//  Created by Gabriele Esposito on 14/11/23.
//

import Foundation

 class CategoriesViewModel{
    var categoryArray : [Categories] = [
        Categories(name: "Playlist", symbol: "music.note.list"),
        Categories(name: "Artists", symbol: "music.mic"),
        Categories(name: "Album", symbol: "square.stack"),
        Categories(name: "Songs", symbol: "music.note"),
        Categories(name: "Generes", symbol: "guitars"),
        Categories(name: "Compilation", symbol: "person.2.crop.square.stack"),
        Categories(name: "Composers", symbol: "music.quarternote.3")
    ]
}
