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
                .frame(width: UIScreen.main.bounds.width / 1.09, height: 15)
                .padding()
                .gesture(DragGesture()
                         /*.onChanged({ //Value in
                          // Code
                          })*/)
            HStack {
                Text("3:45")
                Spacer()
                Text("-0:15")
            }
            .padding()
            
            HStack {
                Button(action: {
                    // Action
                }, label: {
                    Image(systemName: "backward.fill")
                })
                .font(.system(size: 25))
                .padding()
                
                Button(action: {
                    // Action
                }, label: {
                    Image(systemName: "pause.fill")
                })
                .font(.system(size: 30))
                .padding()
                
                Button(action: {
                    // Action
                }, label: {
                    Image(systemName: "forward.fill")
                })
                .font(.system(size: 25))
                .padding()
            }
            .padding()
            
            
            
            HStack {
                Button(action: {
                    // Act
                }, label: {
                    Image(systemName: "speaker.wave.1.fill")
                })
                ProgressView(value: 70, total: 100)
                    .progressViewStyle(ProgressIndicatorView())
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 15)
                    .padding()
                    .gesture(DragGesture()
                             /*.onChanged({ //Value in
                              // Code
                          })*/)
                Button(action: {
                    // Action
                }, label: {
                    Image(systemName: "speaker.wave.3.fill")
                })
            }
        }
    }
}

#Preview {
    SongPlayingViewMax()
}
