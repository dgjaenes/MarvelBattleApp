
import Foundation
import SwiftUI


struct FeaturesProvider {
    static func buildDefaultView() -> SearchCharactersView {
        let interactor = InteractorProvaider.getCharactersInteractor()
        let viewModel = SearchCharactersViewModel(interactor: interactor)
        let view = SearchCharactersView(viewModel: viewModel)
        
        return view
    }
}


