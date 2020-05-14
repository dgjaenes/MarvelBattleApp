//
//  Created by DAVID GONZALEZ on 10/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import Combine

class ManagerMarvelRepository {

    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    internal func execute<T>(components: URLComponents) -> AnyPublisher<T, MarvelError> where T: Decodable {
        guard let url = components.url else {
            let error = MarvelError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }

        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                .network(description: error.localizedDescription)
        }
        .print()
        .map { data, response  in
            guard let response = response as? HTTPURLResponse else {
                print("error httpUrlResponse")
                return data
            }
            guard 200..<300 ~= response.statusCode else {
                print(response.statusCode)
                return data
            }
            return data
        }
        .flatMap() { item in
            decode(item)
        }
        .eraseToAnyPublisher()
    }
}

enum MarvelError: Error {
    case parsing(description: String)
    case network(description: String)
}

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, MarvelError> {
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .secondsSince1970

  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
      .parsing(description: error.localizedDescription)
    }
    .eraseToAnyPublisher()
}
