//
//  TabBarView.swift
//  AppleMusic
//
//  Created by Gabriele Esposito on 15/11/23.
//

import SwiftUI

struct TabBarView: View {
    
    @State var tabSelection = 4
    var songsViewModel = SongsViewModel()
    
    var body: some View {
        TabView(selection: $tabSelection){
            MPYview()
                .tabItem {
                    Image(systemName: "play.circle.fill")
                    Text("Listen Now")
                }
                .tag(1)
            MPYview()
                .tabItem {
                    Image(systemName: "square.split.2x2.fill")
                    Text("Browse")
                }
                .tag(2)
            MPYview()
                .tabItem {
                    Image(systemName: "dot.radiowaves.left.and.right")
                    Text("Radio")
                }
                .tag(3)
            LibraryView()
                .environment(songsViewModel)
                .tabItem {
                    Image(systemName: "square.stack.fill")
                    Text("Library")
                }
                .tag(4)
            MPYview()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(5)
        }.accentColor(.red)
    }
}

#Preview {
    TabBarView()
}
