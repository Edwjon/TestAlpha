import Foundation

public class Juego {
    var jugadores: [Jugador]
    var dado: Dado
    var indiceJugadorActual = 0
    var tablero: [Int: Int]
    
    init(tablero: [Int: Int]) {
        self.jugadores = []
        self.dado = Dado()
        self.tablero = tablero
    }
    
    public func crearJugadores(cantidad: Int, nombres: [String]) {
        guard nombres.count == cantidad else {
            print("La cantidad de nombres no coincide con la cantidad de jugadores requeridos.")
            return
        }
        for nombre in nombres {
            let jugador = Jugador(nombre: nombre)
            jugadores.append(jugador)
        }
    }
    
    public func iniciarJuego(pasarTurno: Bool = true) {
        print("El juego está empezando...\n")
        
        bucleJuego: while true {
            print("========== NUEVO TURNO ==========")
            let jugadorActual = jugadores[indiceJugadorActual]
            print("Turno de \(jugadorActual.nombre).")
            let lanzamiento = dado.lanzar()
            print("El dado sacó un \(lanzamiento)\n")
            jugadorActual.ficha.mover(pasos: lanzamiento, tablero: tablero)
            if jugadorActual.ficha.posicion == 100 {
                print("¡¡¡\(jugadorActual.nombre) HA GANADO EL JUEGO!!!")
                break bucleJuego
            }
            imprimirPosicionesActuales()
            print("\n")
            if pasarTurno {
                indiceJugadorActual = (indiceJugadorActual + 1) % jugadores.count
            }
            print("Presione Enter para continuar al siguiente turno...")
            _ = readLine()
        }
    }
    
    private func imprimirPosicionesActuales() {
        print("Posiciones actuales:")
        for jugador in jugadores {
            print("\(jugador.nombre): casilla \(jugador.ficha.posicion)")
        }
    }
}
