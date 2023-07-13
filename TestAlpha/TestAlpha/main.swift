import Foundation

let serpientesYEscaleras = [2: 38,
                            7: 14,
                            8: 31,
                            16: 6,
                            21: 42,
                            28: 84,
                            36: 44,
                            46: 25,
                            49: 11,
                            51: 67,
                            62: 19,
                            64: 60,
                            71: 91,
                            74: 53,
                            78: 98,
                            87: 94,
                            92: 88,
                            95: 75,
                            99: 80]

// Pide la cantidad de jugadores y sus nombres
var nombresJugadores: [String] = []

bucleJuego: while true {
    print("¿Cuántos jugadores participarán? Introduce un número: ")
    if let entrada = readLine(), let numeroJugadores = Int(entrada), numeroJugadores > 0 {
        // Pide el nombre de los jugadores
        for i in 1...numeroJugadores {
            print("Introduce el nombre del jugador \(i): ")
            if let nombreJugador = readLine() {
                nombresJugadores.append(nombreJugador)
            }
            if i == numeroJugadores {
                break bucleJuego
            }
        }
    } else {
        print("Entrada inválida. Por favor, introduce un número válido de jugadores.")
    }
}

let juego = Juego(tablero: serpientesYEscaleras)
juego.crearJugadores(cantidad: nombresJugadores.count, nombres: nombresJugadores)
juego.iniciarJuego()
