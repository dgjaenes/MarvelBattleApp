
import Foundation
import SwiftUI


struct FeaturesProvider {
    static func buildDefaultView() -> SearchCharactersView {
        let interactor = InteractorProvaider.getCharactersInteractor()
        let viewModel = SearchCharactersViewModel(interactor: interactor)
        let view = SearchCharactersView(viewModel: viewModel)
        
        return view
    }
    
    static func buildArenaView() -> ArenaView {
        let interactor = InteractorProvaider.getCharactersInteractor()
        let rankingInteractor = InteractorProvaider.funcGetPlayerInteractor()
        let viewModel =  ArenaViewModel(interactor: interactor, rankingInteractor: rankingInteractor)
        let view = ArenaView(viewModel: viewModel)
        
        return view
    }
    
    static func builCharacterDetailView(viewModel: CharacterResultViewModel) -> CharacterDetailView {
        CharacterDetailView(viewModel: viewModel)
    }
    
    static func buildRankingView() -> RankingView {
        let rankingInteractor = InteractorProvaider.funcGetPlayerInteractor()
        let viewModel = RankingViewModel(rankingInteractor: rankingInteractor)
        return RankingView(viewModel: viewModel)
    }
}


