
import Foundation

struct InteractorProvaider {
    static func getCharactersInteractor() -> CharacterInteractorProtocol {
        return CharacterInteractorImplement(repository: CharacterReporitoryImplment())
    }
}
