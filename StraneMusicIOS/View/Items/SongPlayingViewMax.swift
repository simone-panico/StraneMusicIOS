//
//  SongPlayingViewMax.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 12.10.2023.
//

import SwiftUI

struct SongPlayingViewMax: View {
    var body: some View {
        VStack {
            Image("test")
                .padding()
            
            Text("Michael Jackson")
                .font(.system(size: 15, weight: .light))
            Text("Beat It")
                .bold()
                .font(.system(size: 25))
            
            
            
            ProgressView(value: 10, total: 100)
                .progressViewStyle(ProgressIndicatorView())
                .frame(width: UIScreen.main.bounds.width / 1.09)
                .padding()
                .gesture(DragGesture()
                         /*.onChanged({ //Value in
                          // Code
                          })*/)
        }
        
    }
}

#Preview {
    SongPlayingViewMax()
}
