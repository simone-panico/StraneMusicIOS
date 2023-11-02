import Foundation

// Definiere eine Struktur, die die JSON-Daten repräsentiert
struct YouTubeSearchResponse: Codable {
    let kind: String
    let etag: String
    let nextPageToken: String
    let regionCode: String
    let pageInfo: PageInfo
    let items: [YouTubeSearchResult]
}

struct PageInfo: Codable {
    let totalResults: Int
    let resultsPerPage: Int
}

struct YouTubeSearchResult: Codable {
    let kind: String
    let etag: String
    let id: YouTubeVideoId
    let snippet: YouTubeSnippet
}

struct YouTubeVideoId: Codable {
    let kind: String
    let videoId: String
}

struct YouTubeSnippet: Codable {
    let publishedAt: String
    let channelId: String
    let title: String
    let description: String
    let thumbnails: YouTubeThumbnails
    let channelTitle: String
    let liveBroadcastContent: String
    let publishTime: String
}

struct YouTubeThumbnails: Codable {
    let `default`: YouTubeThumbnail
    let medium: YouTubeThumbnail
    let high: YouTubeThumbnail
}

struct YouTubeThumbnail: Codable {
    let url: String
    let width: Int
    let height: Int
}

// With Page Token https://youtube.googleapis.com/youtube/v3/search?pageToken=CAoQAA&part=snippet&maxResults=10&q=starboy&key=AIzaSyAS2U9183D5RlbCc3C9E9mzfPFPS4-XqQg


func GetyoutubeData(q: String) {
    print(q)
    // Definiere die URL zur API, von der du die JSON-Daten abrufen möchtest
    if let url = URL(string: "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&q=humble&key=AIzaSyAS2U9183D5RlbCc3C9E9mzfPFPS4-XqQg")
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
            
            print(data)
            
            /*do {
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
            }*/
            
            
            do {
                let decoder = JSONDecoder()
                let searchResponse = try decoder.decode(YouTubeSearchResponse.self, from: data)
                
                // Daten für Thumbnail
                for videoResult in searchResponse.items {
                    let thumbnails = videoResult.snippet.thumbnails.default.url
                    print("Thumbnail: \(thumbnails)")
                }
                
                // Daten für VideoID
                /*
                for videoResult in searchResponse.items {
                    let videoId = videoResult.id.videoId
                    print("Video ID: \(videoId)")
                }*/
                
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
    }
}
