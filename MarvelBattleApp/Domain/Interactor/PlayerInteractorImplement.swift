//
//  PlayerInteractorImplement.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 14/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation

class PlayerInteractorImplement: PlayerInteractorProtocol {
    
    let keyRankings = "keyRankings"
    
    let repository : PlayerRepositoryProtocol
    
    init(repository : PlayerRepositoryProtocol) {
        self.repository = repository
    }
    func getValuesRanking() -> [CharacterDO] {
        let values = repository.getValue(forKey: keyRankings)
        return values.sorted(by: {$0.comics.available > $1.comics.available})
    }
    
    func setValueRanking(values: [CharacterDO]) {
        repository.setValue(value: values, forKey: keyRankings)
    }
}
