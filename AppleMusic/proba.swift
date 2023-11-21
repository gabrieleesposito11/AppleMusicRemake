import SwiftUI
import AVKit


struct ContentView: View {
    @Binding var tabSelection: Int
    @State var showModal =  false
    
    var body: some View {
        
        //ZStack {
            NavigationStack {
                    ScrollView {
                        List {
                            NavigationLink(destination: SwiftUIView())
                            {
                                VStack {
                                    HStack {
                                        Image(systemName: "music.note.list")
                                            .foregroundStyle(.red)
                                        Text("Playlist")
                                        
                                    }
                                }
                            }
                            NavigationLink(destination: SwiftUIView())
                            {
                                VStack {
                                    HStack {
                                        Image(systemName: "music.mic")                                    .foregroundStyle(.red)
                                        Text("Artists")
                                    }
                                }
                            }
                            NavigationLink(destination: SwiftUIView())
                            {
                                VStack {
                                    HStack {
                                        Image(systemName: "square.stack")
                                            .foregroundStyle(.red)
                                        Text("Albums")
                                    }
                                }
                            }
                            NavigationLink(destination: SwiftUIView())
                            {
                                VStack {
                                    HStack {
                                        Image(systemName: "music.note")
                                            .foregroundStyle(.red)
                                        Text("Songs")
                                    }
                                }
                            }
                            NavigationLink(destination: SwiftUIView())
                            {
                                VStack {
                                    HStack {
                                        Image(systemName: "music.note.tv")
                                            .foregroundStyle(.red)
                                        Text("Music Videos")
                                    }
                                }
                            }
                            NavigationLink(destination: SwiftUIView())
                            {
                                VStack {
                                    HStack {
                                        Image(systemName: "guitars")
                                            .foregroundStyle(.red)
                                        Text("Genres")
                                    }
                                }
                            }
                            NavigationLink(destination: SwiftUIView())
                            {
                                VStack {
                                    HStack {
                                        Image(systemName: "person.2.crop.square.stack")
                                            .frame(width: 25)
                                            .foregroundStyle(.red)
                                        Text("Compilations")
                                    }
                                }
                            }
                            NavigationLink(destination: SwiftUIView())
                            {
                                VStack {
                                    HStack {
                                        Image(systemName: "music.quarternote.3")
                                            .foregroundStyle(.red)
                                        Text("Composers")
                                    }
                                }
                            }
                            NavigationLink(destination: SwiftUIView())
                            {
                                VStack {
                                    HStack {
                                        
                                        Text("")
                                    }
                                }
                            }
                        }
                        .scrollDisabled(true)
                        .listStyle(.plain)
                        .frame(width: 400, height: 360.0)
                        
                        VStack(alignment: .leading) {
                            Text("Recently Added")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                                .padding(.leading, 24.0)
                            HStack(spacing: 0.0) {
                                VStack {
                                    Image("AlbumGeolier")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                        .clipShape(RoundedRectangle(cornerRadius: 60))
                                    Text("Il coraggio dei bambini")
                                        .fontWeight(.bold)
                                        .lineLimit(1)
                                        .padding(.top, -15.0)
                                        .frame(width: 150.0)
                                    Text("Geolier")
                                }
                                
                                VStack {
                                    Image("AlbumTurizo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                        .clipShape(RoundedRectangle(cornerRadius: 60))
                                    Text("ADN")
                                        .fontWeight(.bold)
                                        .lineLimit(1)
                                        .padding(.top, -15.0)
                                        .frame(width: 150.0)
                                    Text("Manuel Turizo")
                                }
                                
                                
                            }
                            
                            HStack(spacing: 0.0) {
                                VStack {
                                    Image("AlbumManeskin")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                        .clipShape(RoundedRectangle(cornerRadius: 60))
                                    Text("Il ballo della vita")
                                        .fontWeight(.bold)
                                        .lineLimit(1)
                                        .padding(.top, -15.0)
                                        .frame(width: 150.0)
                                    Text("Maneskin")
                                }
                                VStack {
                                    Image("AlbumCapaldi")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                        .clipShape(RoundedRectangle(cornerRadius: 60))
                                    Text("Divinley Uninspired To A Hellish Extent")
                                        .fontWeight(.bold)
                                        .lineLimit(1)
                                        .padding(.top, -15.0)
                                        .frame(width: 150.0)
                                    Text("Lewis Capaldi")
                                    
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
                Button(action: { showModal = true }) {
                    PlayerView()
                }
                .tint(.black)
                .fullScreenCover(isPresented: $showModal) {
                    CloseModalView()
                }
            }
            
            
            
        }
        
        //.padding()
    }
//}

#Preview {
    TabBarView()
}
