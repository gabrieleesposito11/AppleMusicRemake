//
//  NewPlayerView.swift
//  AppleMusic
//
//  Created by Gabriele Esposito on 18/11/23.
//

import SwiftUI
import AVKit

struct NewPlayerView: View {
    
    var song : Songs
    //@Environment (SongsViewModel.self) var songs
    //git
    
    @State private var player : AVAudioPlayer?
    @State private var isPlaying = false
    @State private var totalTime : TimeInterval = 0.0
    @State private var currentTime : TimeInterval = 0.0
    @State private var animationContent : Bool = false
    @State private var volume: Double = 0
    @State private var currentSong : String?
    private let range: ClosedRange<Double> = 0...100
    @Binding var expandSheet : Bool
    @State var audioFileName: String = ""
    var animation : Namespace.ID
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader{
            let size = $0.size
            let safeArea = $0.safeAreaInsets
            ZStack{
                Rectangle()
                    .fill(.ultraThickMaterial)
                    .overlay(content: {
                        Rectangle()
                        Image(song.image)
                            .blur(radius: 55)
                    })
                VStack(spacing: 15) {
                    GeometryReader{
                        let size = $0.size
                        Image(song.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                            .onTapGesture {
                                dismiss()
                            }
                    }
                    .frame(height: size.width - 50)
                    .padding(.vertical, size.height < 700 ? 10 : 30)
                    PlayerView(size)
                }
                .padding(.top, safeArea.top + (safeArea.bottom == 0 ? 10 : 0))
                .padding(.bottom, safeArea.bottom == 0 ? 10 : safeArea.bottom)
                .padding(.horizontal, 25)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
                .clipped()
            }
            .ignoresSafeArea(.container, edges: .all)
        }
    }
    
    private func setAudio(){
        guard let url = Bundle.main.url(forResource: audioFileName, withExtension: "mp3")
        else{
            return
        }
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            totalTime = player?.duration ?? 0.0
        }catch{
            print("Error loading audio: \(error)")
        }
    }
    
    private func playAudio(){
        player?.play()
        isPlaying = true
    }
    
    private func stopAudio(){
        player?.pause()
        isPlaying = false
    }
    
    private func updateProgress(){
        guard let player = player else {return}
        currentTime = player.currentTime
    }
    
    private func seekAudio(to time: TimeInterval){
        player?.currentTime = time
    }
    
    private func timeString(time: TimeInterval) -> String{
        let minute = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minute, seconds)
    }
    
    @ViewBuilder
    func PlayerView(_ mainSize : CGSize) -> some View{
        GeometryReader{
            let size = $0.size
            let spacing = size.height * 0.04
            VStack(spacing: spacing){
                VStack(spacing: spacing) {
                    HStack(alignment: .center, spacing: 15){
                        VStack(alignment: .leading, spacing: 4){
                            Text(song.title)
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(song.artist)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Button{
                            
                        }label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.white)
                                .padding(12)
                                .background{
                                    Circle()
                                        .fill(.ultraThinMaterial)
                                        .environment(\.colorScheme, .light)
                                }
                        }
                    }
                    Slider(value: Binding(get: {
                        currentTime
                    }, set: { newValue in
                        seekAudio(to: newValue)
                    }), in: 0...totalTime)
                    .foregroundColor(.white)
                    HStack{
                        Text(timeString(time: currentTime))
                        Spacer()
                        Text(timeString(time: totalTime))
                    }
                }
                .frame(height: size.height / 2.5, alignment: .top)
                HStack(spacing: size.width * 0.18){
                    Button{
                        
                    }label: {
                        Image(systemName: "backward.fill")
                            .font(size.height < 300 ? .title3 : .title)
                    }
                    
                    Button{
                        
                    }label: {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .font(size.height < 300 ? .largeTitle : .system(size: 50))
                            .onTapGesture {
                                isPlaying ? stopAudio() : playAudio()
                        }
                    }
                    Button{
                        
                    }label: {
                        Image(systemName: "forward.fill")
                            .font(size.height < 300 ? .title3 : .title)
                    }
                }
                .foregroundColor(.white)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                VStack(spacing: spacing) {
                    HStack {
                        Image(systemName: "speaker.fill")
                        Slider(value: $volume, in: range)
                        Image(systemName: "speaker.wave.3.fill")
                    }
                    HStack(alignment: .top, spacing: size.width * 0.25){
                        Button{
                            
                        }label: {
                            Image(systemName: "quote.bubble")
                        }
                        Button{
                            
                        }label: {
                            Image(systemName: "airplayaudio")
                        }
                        Button{
                            
                        }label: {
                            Image(systemName: "list.dash")
                        }
                    }
                    .foregroundColor(.white)
                    .blendMode(.overlay)
                    .padding(.top, spacing)
                }
                .frame(height: size.height / 2.5, alignment: .bottom)
            }
        }
        .onAppear{
            audioFileName = song.title
            setAudio()
        }
        .onReceive(Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()){_ in
            updateProgress()
        }
    }
}

#Preview {
    NewPlayerView(song: Songs(title: "Indie Happy Rock", image: "Upbeat Indie Happy Rock", artist: "Infraction"), expandSheet: .constant(true), animation: Namespace().wrappedValue).preferredColorScheme(.light)
}

extension View{
    var deviceCornerRadius : CGFloat{
        let key = "_displayCornerRadius"
        if let screen = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.screen{
            if let cornerRadius = screen.value(forKey: key) as? CGFloat{
                return cornerRadius
            }
            return 0
        }
        return 0
    }
}
