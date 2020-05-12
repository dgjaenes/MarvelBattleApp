//
//  CharacterDO.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 10/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation

// MARK: - CharacterDO
struct CharacterDO: Codable {
    let id: Int
    let name, description: String
    let modified: String
    let resourceURI: String
    let urls: [URLElement]
    let thumbnail: ImageData
    let comics: Comics
    let stories: Stories
    let events, series: Comics
}

// MARK: - Comics
struct Comics: Codable {
    let available, returned: Int
    let collectionURI: String
    let items: [ComicsItem]
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI, name: String
}

// MARK: - Stories
struct Stories: Codable {
    let available, returned: Int
    let collectionURI: String
    let items: [StoriesItem]
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI, name, type: String
}

// MARK: - Thumbnail
struct ImageData: Codable {
    let path, ImageExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case ImageExtension = "extension"
    }
}

// MARK: - URLElement
struct URLElement: Codable {
    let type, url: String
}

