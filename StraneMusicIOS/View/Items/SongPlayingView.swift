//
//  SongPlayingView.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 10.10.2023.
//

import SwiftUI

struct SongPlayingView: View {
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color.white.opacity(0.0)).frame(width: UIScreen.main.bounds.size.width, height: 65)
            HStack {
                Button(action: {}) {
                    HStack {
                        Image("Cover").resizable().frame(width: 45, height: 45).shadow(radius: 6, x: 0, y: 3).padding(.leading)
                        Text("Shake It Off").padding(.leading, 10)
                        Spacer()
                    }
                }.buttonStyle(PlainButtonStyle())
                Button(action: {}) {
                    Image(systemName: "play.fill").font(.title3)
                }.buttonStyle(PlainButtonStyle()).padding(.horizontal)
                Button(action: {}) {
                    Image(systemName: "forward.fill").font(.title3)
                }.buttonStyle(PlainButtonStyle()).padding(.trailing, 30)
            }
        }
        
        
        
        
        /*HStack {
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
        }*/
    }
}

#Preview {
    SongPlayingView()
}
