//
//  PlayerInteractorProtocol.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 14/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import Combine

protocol PlayerInteractorProtocol {
    func getValuesRanking() -> [CharacterDO]
    func setValueRanking(values: [CharacterDO])
}
