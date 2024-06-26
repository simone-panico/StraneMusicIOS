//
//  SearchView.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 05.10.2023.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    //@State private var ifSearched = false
    @State var searchResults: YouTubeSearchResponse?
    
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
                if searchText.isEmpty {
                    List {
                        Section(content: {
                            /*SongView()
                            SongView()
                            SongView()
                            SongView()
                            SongView()
                            SongView()*/
                        }, header: {
                            Text("Recent Searched")
                        }) {
                            
                        }
                        
                    }
                    
                } else {
                    
                    
                    List(searchResults?.items ?? [], id: \.id.videoId) { videoResult in
                        SongView(artist: videoResult.snippet.channelTitle, songName: videoResult.snippet.title, pictureLink: videoResult.snippet.thumbnails.default.url)
                        
                        /*VStack(alignment: .leading) {
                            Text("Video ID: \(videoResult.id.videoId)")
                            Text("Title: \(videoResult.snippet.title)")
                            Text("Channel Titel: \(videoResult.snippet.channelTitle)")
                            // Weitere Informationen anzeigen, wie das Thumbnail
                            // Verwende dazu das URL-Objekt, um das Bild aus dem Internet herunterzuladen
                        }*/
                    }
                    
                }
            }
            .searchable(text: $searchText)
            .onSubmit(of: .search) {
                getYoutubeData() { (searchResults) in
                    
                    self.searchResults = searchResults
                    
                }
            }
            .navigationTitle(Text("Search"))
            
        }
        
    }
    
    
    // With Page Token: https://youtube.googleapis.com/youtube/v3/search?pageToken=CAoQAA&part=snippet&maxResults=10&q=starboy&key=AIzaSyAS2U9183D5RlbCc3C9E9mzfPFPS4-XqQg
    func getYoutubeData(completion:@escaping (YouTubeSearchResponse) -> ()) {
        guard let url = URL(string: "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&q=\(searchText)&type=video&key=AIzaSyAS2U9183D5RlbCc3C9E9mzfPFPS4-XqQg") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                        print("Fehler beim Abrufen der Daten: \(error)")
                        return
                    }

                    guard let data = data else {
                        print("Keine Daten")
                        return
                    }
            
            do {
                let decoder = JSONDecoder()
                let searchResults = try decoder.decode(YouTubeSearchResponse.self, from: data)
                print(searchResults)
                
                
                DispatchQueue.main.async {
                    completion(searchResults)
                }
            } catch {
                print("fehler bei Decode \(error)")
            }
            
        }.resume()
        
        
        /*
        // Definiere die URL zur API, von der du die JSON-Daten abrufen möchtest
        if let url = URL(string: "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&q=starboy&key=AIzaSyAS2U9183D5RlbCc3C9E9mzfPFPS4-XqQg")
        //url = URL(string: "https://youtube.googleapis.com/youtube/v3/search?pageToken=CAoQAA&part=snippet&maxResults=10&q=starboy&key=AIzaSyAS2U9183D5RlbCc3C9E9mzfPFPS4-XqQg")
        
        
        {
            
            
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Fehler beim Abrufen der Daten: \(error)")
                    return
                }
                
                guard let data = data else {
                    print("Keine Daten erhalten.")
                    return
                }
                
                do {
                    // Dekodiere die JSON-Daten in Swift-Objekte
                    let decoder = JSONDecoder()
                    let searchResponse = try decoder.decode(YouTubeSearchResponse.self, from: data)
                    
                    // Jetzt kannst du auf die Daten zugreifen
                    print("Kind: \(searchResponse.kind)")
                    print("Etag: \(searchResponse.etag)")
                    print("Nächste Seite: \(searchResponse.nextPageToken)")
                    // usw.
                } catch {
                    print("Fehler beim Dekodieren der JSON-Daten: \(error)")
                }
                
                
                do {
                    let decoder = JSONDecoder()
                    let searchResponse = try decoder.decode(YouTubeSearchResponse.self, from: data)
                    
                    // Daten für Thumbnail
                    for videoResult in searchResponse.items {
                        let thumbnails = videoResult.snippet.thumbnails.default.url
                        print("Thumbnail: \(thumbnails)")
                    }
                    
                    // Daten für VideoID
                    for videoResult in searchResponse.items {
                        let videoId = videoResult.id.videoId
                        print("Video ID: \(videoId)")
                    }
                    
                    // Daten für Titel
                    for videoResult in searchResponse.items {
                        let title = videoResult.snippet.title
                        print("Title: \(title)")
                    }
                    
                    // Daten für ChannelTitel
                    for videoResult in searchResponse.items {
                        let channelTitle = videoResult.snippet.channelTitle
                        print("Channel Titel: \(channelTitle)")
                    }
                    
                } catch {
                    print("Fehler beim Dekodieren der JSON-Daten: \(error)")
                }
                
                
                
            }.resume()
        } else {
            print("Ungültige URL.")
        }*/
    }
}


#Preview {
    SearchView()
}


