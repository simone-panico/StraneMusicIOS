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


