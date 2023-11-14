//
//  YoutubeDLP.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 14.11.2023.



// youtube-dl -o -x --audio-format mp3 '~/Downloads/abdul kalam speech' https://www.youtube.com/watch?v=7E-\(videoID)
// youtube-dl -o --audio-format mp3 '~/testDownloads/blah' https://www.youtube.com/watch?v=BcMm0aaqnnI
// yt-dlp --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --yes-playlist -o '~/testDownloads' 'https://www.youtube.com/watch?v=_epVgBDPBOg'
//yt-dlp --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --yes-playlist -o '~/testDownloads/_epVgBDPBOg' 'https://www.youtube.com/watch?v=_epVgBDPBOg'


import SwiftUI

struct YoutubeDLP: View {
    var body: some View {
        Button("Hello") {
            sendRequest(videoID: "Vifi")
        }
    }
}

#Preview {
    YoutubeDLP()
}



import Foundation

func sendRequest(videoID: String) {
    // Define the server URL
    let serverURL = URL(string: "https://144.2.115.87/videoID")!

    // Create the request
    var request = URLRequest(url: serverURL)
    request.httpMethod = "POST"

    // Add the VideoID as a parameter
    let body = "videoID=\(videoID)"
    request.httpBody = body.data(using: .utf8)

    // Create and resume a data task
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        // Handle the response from the server
        if let error = error {
            print("Error: \(error)")
        } else if let data = data {
            // Process the response data if needed
            let responseString = String(data: data, encoding: .utf8)
            print("Response: \(responseString ?? "")")
        }
    }
    task.resume()
}



