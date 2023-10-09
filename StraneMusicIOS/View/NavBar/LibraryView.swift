//
//  LibraryView.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 05.10.2023.
//

import SwiftUI

struct LibraryView: View {
    private var data: [Int] = Array(1...20)
    private let colors: [Color] = [.red, .blue, .green, .yellow]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(data, id: \.self) { number in
                        ZStack {
                            Rectangle()
                                .frame(width: 170, height: 170)
                                .foregroundStyle(colors[number%4])
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                            Text("\(number)")
                                .foregroundStyle(.white)
                                .font(.system(size: 80, weight: .medium, design: .rounded))
                        }
                    }
                }
            }
            .overlay(
                ProfileView()
                    .padding(.trailing, 20)
                    .offset(x: 0, y: -50),
                alignment: .topTrailing)
            .navigationTitle(Text("Library"))
            
        }
    }
}

#Preview {
    LibraryView()
}
