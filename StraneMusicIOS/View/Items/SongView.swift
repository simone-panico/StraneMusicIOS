//
//  SongView.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 05.10.2023.
//

import SwiftUI

struct SongView: View {
    var artist: String
    var songName: String
    var pictureLink: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: pictureLink)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 30)
                case .failure(_):
                    // Handle failure or use a placeholder image
                    Text("Failed to load image")
                case .empty:
                    // Handle empty state or use a placeholder image
                    Text("Loading...")
                default:
                    Text("Loading...")
                }
            }
            Spacer()
            VStack {
                Text(artist)
                    .font(.system(size: 12, weight: .light))
                Text(songName)
                    .bold()
                    .font(.system(size: 15))
            }
            Spacer()
            Button(action: {
                // Action
            }, label: {
                Image(systemName: "ellipsis")
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
    SongView(artist: "Eminem", songName: "Mockingbird", pictureLink: "")
}
