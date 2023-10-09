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
                List {
                    Text("Hello")
                    Text("hello")
                    SongView()
                }
            }
        }
    }
}

#Preview {
    PlaylistView()
}
