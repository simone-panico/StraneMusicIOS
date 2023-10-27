import SwiftUI

struct ContentView: View {
    @State private var videos: [YouTubeVideo] = []
    
    var body: some View {
        NavigationView {
            List(videos, id: \.id.videoId) { video in
                NavigationLink(destination: VideoDetail(video: video)) {
                    HStack {
                        URLImage(url: video.snippet.thumbnails.medium.url)
                            .frame(width: 80, height: 60)
                        VStack(alignment: .leading) {
                            Text(video.snippet.title)
                                .font(.headline)
                            Text(video.snippet.channelTitle)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .onAppear(perform: fetchYouTubeData)
            .navigationTitle("YouTube Videos")
        }
    }
    
    func fetchYouTubeData() {
        let urlString = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=starboy&key=AIzaSyAS2U9183D5RlbCc3C9E9mzfPFPS4-XqQg" // Replace with the actual API URL
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let youtubeResponse = try decoder.decode(YouTubeSearchResponse.self, from: data)
                        
                        // Now you can access the parsed data
                        let items = youtubeResponse.items
                        for video in items {
                            print("Title: \(video.snippet.title)")
                            print("Video ID: \(video.id.videoId)")
                            // Add more properties as needed
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }.resume()
        }
    }

}

struct VideoDetail: View {
    let video: YouTubeVideo
    
    var body: some View {
        VStack {
            URLImage(url: video.snippet.thumbnails.high.url)
                .frame(height: 200)
            Text(video.snippet.title)
                .font(.title)
            Text(video.snippet.description)
                .font(.subheadline)
        }
    }
}

@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct URLImage: View {
    let url: String
    @State private var image: UIImage?
    
    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
        } else {
            ProgressView()
                .onAppear(perform: loadImage)
        }
    }
    
    private func loadImage() {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let newImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    image = newImage
                }
            }
        }.resume()
    }
}
