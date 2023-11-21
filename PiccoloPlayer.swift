//
//  PiccoloPlayer.swift
//  AppleMusic
//
//  Created by Gabriele Esposito on 15/11/23.
//

import SwiftUI

struct PiccoloPlayer: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 370, height: 50)
                .foregroundColor(.white)
                .shadow(radius: 20)
            HStack {
                Image("Prova")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:40)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .offset(x: 20)
                    
                Text("Prova")
                    .offset(x:40)
                    .bold()
                Spacer()
                HStack {
                    Image(systemName: "play.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                        .offset(x:-18)
                    Image(systemName: "forward.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30)
                }
                .offset(x:-33)
            }
        }.offset(y:335)
    }
}

#Preview {
    PiccoloPlayer()
}
