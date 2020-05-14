//
//  ArenaViewModel.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 13/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import SwiftUI
import Combine

class ArenaViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var dataSource: [CharacterResultViewModel] = []
    @Published var player1: CharacterResultViewModel?
    @Published var player2: CharacterResultViewModel?
    @Published var alertPLayWinner: Bool = false
    @Published var playerWinner: CharacterResultViewModel?
    
    private let interactor: CharacterInteractorProtocol
    private var disposables = Set<AnyCancellable>()
    
    init(interactor: CharacterInteractorProtocol, scheduler: DispatchQueue = DispatchQueue(label: "ArenaViewModel")) {
        self.interactor = interactor
        $name
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .sink(receiveValue: searchCharacter(name:))
            .store(in: &disposables)
    }
    
    private func searchCharacter(name: String) {
        interactor.getCharacters(name: name)
            .map { response in
                response.data.results.map(CharacterResultViewModel.init)
        }
        .receive(on: DispatchQueue.main)
        .sink(
            receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure (let error):
                    print(error.localizedDescription)
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
    
    func setItem(item: CharacterResultViewModel?) {
        if player1 != nil && player2 == nil {
            self.player2 = item
        } else if player2 != nil {
            self.player1 = item
        } else {
            self.player1 = item
        }
        self.dataSource = []
        self.name = ""
    }
    
    func initView() {
        self.dataSource = []
        self.name = ""
        self.player1 = nil
        self.player2 = nil
        self.playerWinner = nil
        self.alertPLayWinner = false
    }
    
    func playBattle() {
        if player2?.comicsCount ?? 0 > player1?.comicsCount ?? 0 {
            playerWinner = player2
        } else {
            playerWinner = player1
        }
        alertPLayWinner = true
        //reset()
    }
    
    private func getImagenes() {
        dataSource.enumerated().forEach({ index, item in
            dataSource[index].image = interactor.getImage(pahtImg: item.imagePaht, extensionImg: item.imageExtension)
        })
    }
}

