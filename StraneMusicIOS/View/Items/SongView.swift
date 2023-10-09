//
//  SongView.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 05.10.2023.
//

import SwiftUI

struct SongView: View {
    var body: some View {
        HStack {
            Image("test2")
                .resizable()
                .frame(width: 40, height: 30)
                .aspectRatio(contentMode: .fit)
            Spacer()
            VStack {
                Text("JUCE WRLD")
                    .font(.system(size: 12, weight: .light))
                Text("JUCE WRLD")
                    .bold()
                    .font(.system(size: 15))
            }
            Spacer()
            Button(action: {
                // Actio
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
    SongView()
}
