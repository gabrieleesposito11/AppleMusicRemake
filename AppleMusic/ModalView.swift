//
//  ModalView.swift
//  AppleMusic
//
//  Created by Gabriele Esposito on 16/11/23.
//

import SwiftUI

struct ModalView: View {
    
    @State var showModal = false
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {showModal.toggle()})
        {
            PiPlayerView(song: Songs(title: "Indie Happy Rock", image: "Upbeat Indie Happy Rock", artist: "Infraction"))
        }.fullScreenCover(isPresented: $showModal){
            NewPlayerView(song: Songs(title: "Indie Happy Rock", image: "Upbeat Indie Happy Rock", artist: "Infraction"), expandSheet: .constant(true), animation: Namespace().wrappedValue).preferredColorScheme(.light)
        }
    }
}

#Preview {
    ModalView()
}
