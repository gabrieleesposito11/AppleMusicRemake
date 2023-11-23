//
//  AppleMusicApp.swift
//  AppleMusic
//
//  Created by Gabriele Esposito on 14/11/23.
//

import SwiftUI

@main
struct AppleMusicApp: App {
    
    var songsViewModel = SongsViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }.environment(songsViewModel)
    }
}
