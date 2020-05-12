//
//  CharacterReporitoryImplment.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 10/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import Combine

class CharacterReporitoryImplment: ManagerMarvelRepository, CharacterReporitoryProtocol {
    
    struct MarvelAPI {
        static let scheme = "http"
        static let host = "gateway.marvel.com"
        static let path = "/v1/public"
    }
    
    func getCharacters(name: String?) -> AnyPublisher<CharactersResponseDO, MarvelError> {
        return execute(components: makeCharactersUrltComponents(name: name))
    }
    
    func makeCharactersUrltComponents(name: String?) -> URLComponents {
        var components = URLComponents()
        components.scheme = MarvelAPI.scheme
        components.host = MarvelAPI.host
        components.path = MarvelAPI.path + "/characters"
        
        components.queryItems = [URLQueryItem(name: "ts", value: "1"),
                                 URLQueryItem(name: "apikey", value: "596593acfee9dd9dee50fec70e79fdd5"),
                                 URLQueryItem(name: "hash", value: "653680c61c9df51c24eda7f2bd53f1bc"),
                                 URLQueryItem(name: "name", value: name),
                                 URLQueryItem(name: "orderBy", value: "modified"),
                                 URLQueryItem(name: "limit", value: "30")
        ]
        
        return components
    }
}
