//
//  PlaylistView.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 09.10.2023.
//

import SwiftUI

struct PlaylistView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("test")
                HStack {
                    Button(action: {
                        
                    }, label: {
                        Text("Play")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    })
                    .buttonStyle(.borderedProminent)
                    Button(action: {
                        
                    }, label: {
                        Text("Random")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    })
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                VStack {
                    List {
                        SongView()
                        SongView()
                        SongView()
                        SongView()
                        SongView()
                        SongView()
                    }
                }
            }
            .navigationTitle("Playlist Name")
        }
    }
}

#Preview {
    PlaylistView()
}
