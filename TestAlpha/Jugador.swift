import Foundation

class Jugador {
    let nombre: String
    var ficha: Ficha
    
    init(nombre: String) {
        self.nombre = nombre
        self.ficha = Ficha(posicionInicial: 1)
    }
}
