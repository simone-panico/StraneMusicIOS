//
//  ContentView.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 05.10.2023.
//

import SwiftUI

struct HomeView: View {
    private var data: [Int] = Array(1...10)
    private let colors: [Color] = [.red, .blue, .green, .yellow]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    let rows = [
            GridItem(.fixed(50))
        ]
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Playlist")
                    .font(.system(size: 30, weight: .medium))
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, alignment: .center) {
                        ForEach(data, id: \.self) { number in
                            Rectangle()
                                .frame(width: 170, height: 170)
                                .foregroundStyle(colors[number%4])
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                            
                        }
                    }
                }
                .padding()
                Spacer()
                .padding()
                Text("Songs")
                    .font(.system(size: 30, weight: .medium))
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, alignment: .center) {
                        ForEach(data, id: \.self) { number in
                            Rectangle()
                                .frame(width: 170, height: 170)
                                .foregroundStyle(colors[number%4])
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                            
                        }
                    }
                }
                .padding()
                Spacer()
                .padding()
                Text("Top 10")
                    .font(.system(size: 30, weight: .medium))
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, alignment: .center) {
                        ForEach(data, id: \.self) { number in
                            Rectangle()
                                .frame(width: 170, height: 170)
                                .foregroundStyle(colors[number%4])
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                            
                        }
                    }
                }
                .padding()
                Spacer()
                .padding()
            }
            .overlay(
                ProfileView()
                    .padding(.trailing, 20)
                    .offset(x: 0, y: -50),
                alignment: .topTrailing)
            .navigationTitle(Text("Home"))
        }
        
    }
}

#Preview {
    HomeView()
}
