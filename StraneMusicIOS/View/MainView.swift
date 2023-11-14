//
//  MainView.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 05.10.2023.
//

import SwiftUI

struct NowPlayingBar<Content: View>: View {
    var content: Content

    @ViewBuilder var body: some View {
        ZStack(alignment: .bottom) {
            //content
            ZStack {
                Rectangle().foregroundColor(Color.white.opacity(0.0)).frame(width: UIScreen.main.bounds.size.width, height: 65)
                HStack {
                    Button(action: {}) {
                        HStack {
                            Image("cover").resizable().frame(width: 45, height: 45).shadow(radius: 6, x: 0, y: 3).padding(.leading)
                            Text("Shake It Off").padding(.leading, 10)
                            Spacer()
                        }
                    }.buttonStyle(PlainButtonStyle())
                    Button(action: {}) {
                        Image(systemName: "play.fill").font(.title3)
                    }.buttonStyle(PlainButtonStyle()).padding(.horizontal)
                    Button(action: {}) {
                        Image(systemName: "forward.fill").font(.title3)
                    }.buttonStyle(PlainButtonStyle()).padding(.trailing, 30)
                }
            }
        }
    }
}

struct MainView: View {
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
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
                YoutubeDLP()
                .tabItem {
                    Label(
                        title: { Text("Browse") },
                        icon: { Image(systemName: "square.grid.3x3") }
                    )
                }
            }
            SongPlayingView()
                .frame(height: 80)
                .offset(y: -49)
        })
        
        
    }
}

#Preview {
    MainView()
}
