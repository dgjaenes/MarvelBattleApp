//
//  MarvelBattleAppTests.swift
//  MarvelBattleAppTests
//
//  Created by DAVID GONZALEZ on 11/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import XCTest
import Combine
@testable import MarvelBattleApp

class MarvelBattleAppTests: XCTestCase {

    var characters = [CharacterResultViewModel]()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var disposables = Set<AnyCancellable>()
        
        let interactor = CharacterInteractorImplement(repository: CharacterReporitoryImplment(session: .shared))
        _ = interactor.getCharacters(name: "Hulk")
        .map { response in
        response.data.results.map(CharacterResultViewModel.init)
            }
            .receive(on: DispatchQueue.main)
            .sink(
              receiveCompletion: { [weak self] value in
                guard self != nil else { return }
                switch value {
                case .failure:
                    self?.characters = []
                    XCTAssertEqual(self?.characters.count, 1)
                    break
                case .finished:
                    XCTAssertEqual(self?.characters.count, 1)
                  break
                }
              },
              receiveValue: { [weak self] characters in
                guard self != nil else { return }
                self?.characters = characters
            }).store(in: &disposables)
        
    }
}
