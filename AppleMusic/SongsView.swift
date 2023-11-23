//
//  PlayerView.swift
//  AppleMusic
//
//  Created by Gabriele Esposito on 14/11/23.
//

import SwiftUI

struct SongsView: View {
    
    var song = SongsViewModel()
    @Environment(SongsViewModel.self) var songViewModel
    @State private var searchText = ""
    @State var showModal = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            List {
                HStack {
                    Spacer()
                    HStack{
                        Button{
                            
                        }label: {
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
                        }
                        Spacer()
                        Button{
                            
                        }label: {
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
                    }
                    Spacer()
                }
                ForEach(songViewModel.song){ canzone in
                    Button(action: {
                        songViewModel.currentSong = canzone
                    }){
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
            Button(action: {self.showModal = true}){
                PiPlayerView(song: songViewModel.currentSong)
            }.tint(.black)
            .fullScreenCover(isPresented: $showModal, onDismiss: {
                self.showModal = false
            }){
                NewPlayerView(song: songViewModel.currentSong, expandSheet: .constant(true), animation: Namespace().wrappedValue).presentationDetents([.height(.infinity)])
            }
        }
        .searchable(text: $searchText, prompt: "Find in Songs")
    }
}

#Preview {
    SongsView()
        .environment(SongsViewModel())
}
