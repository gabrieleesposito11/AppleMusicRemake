//
//  ContentView.swift
//  AppleMusic
//
//  Created by Gabriele Esposito on 14/11/23.
//

import SwiftUI

struct LibraryView: View {
    
    var category = CategoriesViewModel()
    var song1 = SongsViewModel()
    @Environment (SongsViewModel.self) var songsViewModel
    @State var showModal = false
    @Environment(\.dismiss) var dismiss
    /*var songIndex : Int {
        songsViewModel.song.firstIndex(where: {$0.id == song.id})
    }*/
    //@Binding var tabSelection() : Int
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    List {
                        ForEach(category.categoryArray){ categoria in
                            NavigationLink(destination: SongsView()) {
                                HStack {
                                    Image(systemName: categoria.symbol)
                                        .foregroundColor(.red)
                                        .frame(width: 30)
                                    Text(categoria.name)
                                }
                            }
                        }
                    }
                    .scrollDisabled(true)
                    .listStyle(.plain)
                    .frame(width: 400, height: 300.0)
                    
                    VStack {
                        HStack {
                            Text("Recently Added")
                                .bold()
                                .font(.system(size: 25))
                            Spacer()
                        }
                        .padding()
                        ForEach(song1.song) { canzone in
                            HStack {
                                Spacer()
                                VStack (alignment: .leading){
                                    Image(canzone.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:160)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                    Text(canzone.title)
                                    Text(canzone.artist)
                                        .opacity(0.5)
                                    Spacer()
                                }
                                Spacer()
                                VStack (alignment: .leading){
                                    Image(canzone.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:160)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    Text(canzone.title)
                                    Text(canzone.artist)
                                        .opacity(0.5)
                                    Spacer()
                                }
                                Spacer()
                            }
                        }
                    }
                    .navigationTitle("Library")
                    .toolbar {
                        ToolbarItem{
                            EditButton()
                                .tint(.red)
                        }
                    }
                }
                Button(action: {self.showModal = true}){
                    PiPlayerView(song: Songs(title: "Indie Happy Rock", image: "Upbeat Indie Happy Rock", artist: "Infraction"))
                }.tint(.black)
                .fullScreenCover(isPresented: $showModal, onDismiss: {
                    self.showModal = false
                }){
                    NewPlayerView(song: Songs(title: "Indie Happy Rock", image: "Upbeat Indie Happy Rock", artist: "Infraction"), expandSheet: .constant(true), animation: Namespace().wrappedValue).presentationDetents([.height(.infinity)])
                }
            }.accentColor(.red)
        }
    }
}

#Preview {
    TabBarView()
}
