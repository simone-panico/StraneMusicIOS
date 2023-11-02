//
//  SearchView.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 05.10.2023.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    
    
    private var data: [Int] = Array(1...20)
    private let colors: [Color] = [.red, .blue, .green, .yellow]
    
    var body: some View {
        NavigationStack {
            /*ScrollView {
                LazyVGrid(columns: [GridItem(.fixed(1))], spacing: 20) {
                    /*ForEach(data, id: \.self) { number in
                        ZStack {
                            Rectangle()
                                .frame(width: 1000, height: 100)
                                .foregroundStyle(colors[number%4])
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        }
                    }*/
                    SongView()
                }
            }*/
            VStack {
                List {
                    Section(content: {
                        SongView()
                        SongView()
                        SongView()
                        SongView()
                        SongView()
                        SongView()
                    }, header: {
                        Text("Recent Searched")
                    }) {
                        
                    }
                    
                }

            }
            .searchable(text: $searchText)
            .onSubmit(of: .search) {
                GetyoutubeData(q: searchText)
            }
            .navigationTitle(Text("Search"))
            
        }
        
    }
}

#Preview {
    SearchView()
}
