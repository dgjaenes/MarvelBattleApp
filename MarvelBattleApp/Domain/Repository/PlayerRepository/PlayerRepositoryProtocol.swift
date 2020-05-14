//
//  PlayerRepositoryProtocol.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 14/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation

protocol PlayerRepositoryProtocol {
    func getValue(forKey key: String) -> [CharacterDO]
    func setValue(value: [CharacterDO], forKey key: String)
}
