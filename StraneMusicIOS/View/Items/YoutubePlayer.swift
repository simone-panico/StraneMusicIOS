//
//  YoutubePlayer.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 12.11.2023.
//

import SwiftUI
import WebKit

struct YoutubePlayer: UIViewRepresentable {
    
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {return}
        
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}
