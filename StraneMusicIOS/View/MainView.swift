//
//  MainView.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 05.10.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                Label(
                    title: { Text("Home") },
                    icon: { Image(systemName: "house") }
                )
            }
            SearchView()
            .tabItem {
                Label(
                    title: { Text("Search") },
                    icon: { Image(systemName: "magnifyingglass") }
                )
            }
            LibraryView()
            .tabItem {
                Label(
                    title: { Text("Library") },
                    icon: { Image(systemName: "play.square.stack") }
                )
            }
            BrowseView()
            .tabItem {
                Label(
                    title: { Text("Browse") },
                    icon: { Image(systemName: "square.grid.3x3") }
                )
            }
        }
    }
}

#Preview {
    MainView()
}
