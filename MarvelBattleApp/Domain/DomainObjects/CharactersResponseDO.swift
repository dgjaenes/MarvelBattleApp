//
//  MarvelCharactersDO.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 10/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation

// MARK: - ResponseCharactersDO
struct CharactersResponseDO: Codable {
    let code: Int
    let status, copyright, attributionText: String
    let attributionHTML: String
    let data: DataClass
    let etag: String
}

// MARK: - DataClass
struct DataClass: Codable {
    let offset, limit, total, count: Int
    let results: [CharacterDO]
}
