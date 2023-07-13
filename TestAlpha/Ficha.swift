import Foundation

class Ficha {
    var posicion: Int
    
    init(posicionInicial: Int) {
        self.posicion = posicionInicial
    }
    
    func mover(pasos: Int, tablero: [Int: Int]) {
        let nuevaPosicion = self.posicion + pasos
        if nuevaPosicion <= 100 {
            self.posicion = nuevaPosicion
        } else {
            return
        }
        
        // Revisar si hay escalera o serpiente
        if let posicionFinal = tablero[self.posicion] {
            if posicionFinal > self.posicion {
                print("¡Cayó en una escalera! Suba a la casilla \(posicionFinal).\n")
            } else if posicionFinal < self.posicion {
                print("¡Cayó en una serpiente! Baje a la casilla \(posicionFinal).\n")
            }
            self.posicion = posicionFinal
        }
    }
}
