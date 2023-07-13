import Foundation

class Dado {
    func lanzar() -> Int {
        return Int.random(in: 1...6)
    }
}
