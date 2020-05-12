//
//  CharacterInteractorProtocol.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 10/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import Combine

protocol CharacterInteractorProtocol {
    func getCharacters(name: String?) -> AnyPublisher<CharactersResponseDO, MarvelError>
    func getImage(pahtImg: String, extensionImg: String) -> Data?
}
