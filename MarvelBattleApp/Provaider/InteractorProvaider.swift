
import Foundation

struct InteractorProvaider {
    static func getCharactersInteractor() -> CharacterInteractorProtocol {
        return CharacterInteractorImplement(repository: CharacterReporitoryImplment())
    }
    
    static func funcGetPlayerInteractor() -> PlayerInteractorProtocol {
        return PlayerInteractorImplement(repository: PlayerRepositoryImplement())
    }
}
