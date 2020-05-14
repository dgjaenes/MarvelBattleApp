//
//  CharacterResultRowViewModel.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 11/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import SwiftUI

struct CharacterResultViewModel: Identifiable {
    
    private let item: CharacterDO
    
    var index: Int?
    var image: Data?
    
    var id: String {
        return String(item.id)
    }
    
    var name: String {
        return item.name
    }
    
    var description: String {
        return item.description
    }
    
    var imagePaht: String {
        return item.thumbnail.path
    }
    
    var imageExtension: String {
        return item.thumbnail.ImageExtension
    }
    
    var comicsCount: Int {
        return item.comics.available
    }
    
    init(item: CharacterDO) {
        self.item = item
    }
    
    func getPlayer() -> CharacterDO {
        var player = item
        player.imageData = image
        return player
    }
    
    mutating func getImageLocal() {
        self.image = item.imageData
    }
}

extension CharacterResultViewModel: Hashable {
    static func == (lhs: CharacterResultViewModel, rhs: CharacterResultViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
