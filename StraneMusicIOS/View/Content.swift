//
//  Content.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 22.10.2023.
//

import SwiftUI

struct Content: View {
    private var video: [YoutubeDL] = YoutubeDL.all
    
    var body: some View {
        NavigationView {
            List {
                ForEach(video, id: \.kind) {
                    youtubeVideo in
                    Text("\(youtubeVideo.kind)")
                }
            }
        }
    }
}

#Preview {
    Content()
}
