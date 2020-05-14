//
//  RankingViewModel.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 14/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import Combine

class RankingViewModel : ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    var dataSource: [CharacterResultViewModel] = [] {
        willSet{
            objectWillChange.send()
        }
    }
    
    private let rankingInteractor: PlayerInteractorProtocol
    
    init(rankingInteractor: PlayerInteractorProtocol) {
        self.rankingInteractor = rankingInteractor
    }
    
    func initView() {
        var viewModels = rankingInteractor.getValuesRanking().map(CharacterResultViewModel.init)
        viewModels.enumerated().forEach({ (index, item) in
            viewModels[index].index = index + 1
            viewModels[index].getImageLocal()
        })
        dataSource = viewModels
    }
}
