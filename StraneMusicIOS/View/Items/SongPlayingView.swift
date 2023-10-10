//
//  SongPlayingView.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 10.10.2023.
//

import SwiftUI

struct SongPlayingView: View {
    var body: some View {
        HStack {
            Image("test2")
                .resizable()
                .frame(width: 40, height: 30)
                .aspectRatio(contentMode: .fit)
            Spacer()
            VStack {
                Text("Artist")
                    .font(.system(size: 12, weight: .light))
                Text("Song Name")
                    .bold()
                    .font(.system(size: 15))
            }
            Spacer()
            Button(action: {
                // Action
            }, label: {
                Image(systemName: "backward.fill")
            })
            Button(action: {
                // Action
            }, label: {
                Image(systemName: "play.fill")
            })
            Button(action: {
                // Action
            }, label: {
                Image(systemName: "forward.fill")
            })
            
            
            /*
            Button(action: {
                // Action
            }, label: {
                Image(systemName: "backward.fill")
            })
            Button(action: {
                // Action
            }, label: {
                Image(systemName: "pause.fill")
            })
            Button(action: {
                // Action
            }, label: {
                Image(systemName: "forward.fill")
            })*/
        }
    }
}

#Preview {
    SongPlayingView()
}
