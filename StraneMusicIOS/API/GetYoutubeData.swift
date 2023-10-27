//
//  GetYoutubeData.swift
//  StraneMusicIOS
//
//  Created by Simone Panico on 19.10.2023.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   x

import Foundation

struct YouTubeSearchResponse: Codable {
    let kind: String
    let etag: String
    let nextPageToken: String
    let regionCode: String
    let pageInfo: PageInfo
    let items: [YouTubeVideo]
}

struct PageInfo: Codable {
    let totalResults: Int
    let resultsPerPage: Int
}

struct YouTubeVideo: Codable {
    let kind: String
    let etag: String
    let id: VideoId
    let snippet: VideoSnippet
}

struct VideoId: Codable {
    let kind: String
    let videoId: String
}

struct VideoSnippet: Codable {
    let publishedAt: String
    let channelId: String
    let title: String
    let description: String
    let thumbnails: Thumbnails
    let channelTitle: String
    let liveBroadcastContent: String
    let publishTime: String
}

struct Thumbnails: Codable {
    let `default`: Thumbnail
    let medium: Thumbnail
    let high: Thumbnail
}

struct Thumbnail: Codable {
    let url: String
    let width: Int
    let height: Int
}
