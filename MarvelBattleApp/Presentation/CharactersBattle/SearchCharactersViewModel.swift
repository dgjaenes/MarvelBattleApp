//
//  SearchCharactersBattleViewModel.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 11/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import SwiftUI
import Combine

class SearchCharactersViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var dataSource: [CharacterResultViewModel] = []
    
    private let interactor: CharacterInteractorProtocol
    private var disposables = Set<AnyCancellable>()
    
    init(interactor: CharacterInteractorProtocol, scheduler: DispatchQueue = DispatchQueue(label: "SearchCharactersViewModel")) {
        self.interactor = interactor
        $name
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .sink(receiveValue: searchCharacter(name:))
            .store(in: &disposables)
    }
    
    func searchCharacter(name: String) {
        interactor.getCharacters(name: name)
            .map { response in
                response.data.results.map(CharacterResultViewModel.init)
        }
        .receive(on: DispatchQueue.main)
        .sink(
            receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSource = []
                case .finished:
                    break
                }
            },
            receiveValue: { [weak self] results in
                guard let self = self else { return }
                self.dataSource = results
                self.getImagenes()
        })
            .store(in: &disposables)
    }
    
    private func getImagenes() {
        dataSource.enumerated().forEach({ index, item in
            dataSource[index].image = interactor.getImage(pahtImg: item.imagePaht, extensionImg: item.imageExtension)
        })
    }
}
