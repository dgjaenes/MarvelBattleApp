//
//  CharacterInteractorImplement.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 10/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import Combine

class CharacterInteractorImplement: CharacterInteractorProtocol {
    
    var repository: CharacterReporitoryProtocol
    
    init(repository: CharacterReporitoryProtocol) {
        self.repository = repository
    }
    
    func getCharacters(name: String?) -> AnyPublisher<CharactersResponseDO, MarvelError> {
        
        return repository.getCharacters(name: name)
    }
    
    func getImage(pahtImg: String, extensionImg: String) -> Data? {
        if let url = URL(string: "\(pahtImg).\(extensionImg)") {
                do{
                    let imageData: Data = try Data(contentsOf: url)
                    return imageData
                }catch{
                        print("Unable to load data: \(error)")
                    return nil
                }
        }
        return nil
    }
    
}
