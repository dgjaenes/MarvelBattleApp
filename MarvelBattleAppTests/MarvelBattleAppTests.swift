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

class MarvelBattleAppTests: XCTestCase, ObservableObject {

    @Published var craracters = [CharacterDO]()
    
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
        let any = interactor.getCharacters(name: "Hulk")
        .map { response in
            self.craracters.append(contentsOf: response)
            }
            .receive(on: DispatchQueue.main)
            .sink(
              receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                  //self.dataSource = []
                    break
                case .finished:
                  break
                }
              },
              receiveValue: { [weak self] forecast in
                guard let self = self else { return }
                //self.dataSource = forecast
            }).store(in: &disposables)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
