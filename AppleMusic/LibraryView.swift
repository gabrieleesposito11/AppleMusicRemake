//
//  ContentView.swift
//  AppleMusic
//
//  Created by Gabriele Esposito on 14/11/23.
//

import SwiftUI

struct LibraryView: View {
    
    var category = CategoriesViewModel()
    @Environment (SongsViewModel.self) var songsViewModel
    @State var showModal = false
    @Environment(\.dismiss) var dismiss
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 170))
    ]
    
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
                        ForEach(songsViewModel.song) { canzone in
                            //HStack {
                                //Spacer()
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
                                //Spacer()
//                                VStack (alignment: .leading){
//                                    Image(canzone.image)
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width:160)
//                                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                                    Text(canzone.title)
//                                    Text(canzone.artist)
//                                        .opacity(0.5)
//                                    Spacer()
//                                }
                                //Spacer()
                         //   }
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
                    PiPlayerView(song: songsViewModel.currentSong)
                }.tint(.black)
                .fullScreenCover(isPresented: $showModal, onDismiss: {
                    self.showModal = false
                }){
                    NewPlayerView(song: songsViewModel.currentSong , expandSheet: .constant(true), animation: Namespace().wrappedValue).presentationDetents([.height(.infinity)])
                }
            }.accentColor(.red)
        }
    }
}

#Preview {
    TabBarView()
        .environment(SongsViewModel())
}
