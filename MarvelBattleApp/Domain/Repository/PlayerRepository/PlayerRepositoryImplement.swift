//
//  PlayerRepository.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 14/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation


class PlayerRepositoryImplement: PlayerRepositoryProtocol, Codable {
    
    func getValue(forKey key: String) -> [CharacterDO]{
        
        var valueresult: [CharacterDO]? = nil
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            valueresult = try? PropertyListDecoder().decode([CharacterDO].self, from: data)
            return valueresult!
        } else {
            return []
        }
    }
    
    func setValue(value: [CharacterDO], forKey key: String){
        var values : [CharacterDO] = self.getValue(forKey: key)
        
        value.enumerated().forEach({ index, item in
            
            values.enumerated().forEach({ indexV, itemV in
                if itemV == item {
                    values.remove(at: indexV)
                }
                
            })
        })
        
        values.append(contentsOf: value)
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(values), forKey: key)
    }
    
}
