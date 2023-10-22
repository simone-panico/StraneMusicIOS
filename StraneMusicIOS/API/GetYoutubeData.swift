//
//  GetYoutubeData.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 19.10.2023.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let youtubeDL = try? JSONDecoder().decode(YoutubeDL.self, from: jsonData)

import Foundation

// MARK: - YoutubeDL
struct YoutubeDL: Codable {
    var kind, etag, nextPageToken, regionCode: String
    var pageInfo: PageInfo
    var items: [Item]
    
    static let all: [YoutubeDL] = Bundle.main.decode(file: "test.json")
    static let sample: YoutubeDL = all[0]
}

// MARK: - Item
struct Item: Codable {
    var kind, etag: String
    var id: ID
    var snippet: Snippet
}

// MARK: - ID
struct ID: Codable {
    var kind, videoID: String

    enum CodingKeys: String, CodingKey {
        case kind
        case videoID
    }
}

// MARK: - Snippet
struct Snippet: Codable {
    var publishedAt: Date
    var channelID, title, description: String
    var thumbnails: Thumbnails
    var channelTitle, liveBroadcastContent: String
    var publishTime: Date

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID
        case title, description, thumbnails, channelTitle, liveBroadcastContent, publishTime
    }
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    var thumbnailsDefault, medium, high: Default

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault
        case medium, high
    }
}

// MARK: - Default
struct Default: Codable {
    var url: String
    var width, height: Int
}

// MARK: - PageInfo
struct PageInfo: Codable {
    var totalResults, resultsPerPage: Int
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the Project")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) in the Project")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) in the Project")
        }
        
        return loadedData
    }
}
