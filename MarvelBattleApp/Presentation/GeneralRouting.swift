//
//  GeneralRouting.swift
//  MarvelBattleApp
//
//  Created by DAVID GONZALEZ on 14/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import SwiftUI

struct GeneralRouting {
    static func getInitView() -> SearchCharactersView {
        FeaturesProvider.buildDefaultView()
    }
    
    static func getDetailView(viewModel: CharacterResultViewModel) -> CharacterDetailView {
        FeaturesProvider.builCharacterDetailView(viewModel: viewModel)
    }
    
    static func getArenaView() -> ArenaView {
        FeaturesProvider.buildArenaView()
    }
    
    static func getRankingView() -> RankingView {
        FeaturesProvider.buildRankingView()
    }
}
