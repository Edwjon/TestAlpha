import XCTest

final class PruebasDeJuego: XCTestCase {

    // Historia de Usuario 1
    func testMoverFicha() {
        //UAT 1
        let ficha = Ficha(posicionInicial: 1)
        XCTAssertEqual(ficha.posicion, 1, "La ficha empieza el juego en la posición 1")
        
        //UAT 2
        // Prueba para movimiento válido
        let tablero = [3: 16, 15: 10, 23: 29, 42: 81, 56: 75, 62: 18, 64: 60, 87: 49, 93: 71, 95: 73, 98: 78]
        ficha.mover(pasos: 3, tablero: tablero)
        XCTAssertEqual(ficha.posicion, 4, "La ficha no se movió a la posición correcta.")
        
        //UAT 3
        ficha.mover(pasos: 4, tablero: tablero)
        XCTAssertEqual(ficha.posicion, 8, "La ficha no se movió a la posición correcta.")

        // Prueba para movimiento inválido
        ficha.mover(pasos: 100, tablero: tablero)
        XCTAssertNotEqual(ficha.posicion, 108, "La ficha no debería moverse más allá del límite del tablero.")
    }
    
    // Historia de Usuario 2
    func testJugadorGanandoElJuego() {
        //UAT 1
        let ficha = Ficha(posicionInicial: 97)
        let tablero = [3: 16, 15: 10, 23: 29, 42: 81, 56: 75, 62: 18, 64: 60, 87: 49, 93: 71, 95: 73, 98: 78]
        
        // Prueba para ganar el juego
        ficha.mover(pasos: 3, tablero: tablero)
        XCTAssertEqual(ficha.posicion, 100, "La ficha no se movió a la posición final y el usuario ganó.")

        //UAT 2
        //Prueba para no poder ganar el juego si se mueve más allá del 100
        let ficha2 = Ficha(posicionInicial: 97)
        ficha2.mover(pasos: 4, tablero: tablero)
        XCTAssertEqual(ficha2.posicion, 97, "La ficha no debería moverse más allá de la posición final.")
    }
    
    // Historia de Usuario 3
    func testFichaSeMueveConLanzamientoDeDado() {
        let ficha = Ficha(posicionInicial: 1)
        let dado = Dado()
        let lanzamiento = dado.lanzar()
        let tablero = [3: 16, 15: 10, 23: 29, 42: 81, 56: 75, 62: 18, 64: 60, 87: 49, 93: 71, 95: 73, 98: 78]
        
        // Prueba para movimiento válido
        ficha.mover(pasos: lanzamiento, tablero: tablero)
        XCTAssertEqual(ficha.posicion, 1 + lanzamiento, "La ficha no se movió a la posición correcta.")
        
        // Prueba para movimiento inválido
        ficha.mover(pasos: 100, tablero: tablero)
        XCTAssertNotEqual(ficha.posicion, 1 + lanzamiento + 100, "La ficha no debería moverse más allá del límite del tablero.")
    }
    
    // Historia de usuario 4: Prueba para moverse hacia arriba por una escalera
    func testMoverFichaArribaPorEscalera() {
        let ficha = Ficha(posicionInicial: 1)
        let tablero = [3: 16, 15: 10, 23: 29, 42: 81, 56: 75, 62: 18, 64: 60, 87: 49, 93: 71, 95: 73, 98: 78]

        // Prueba para un movimiento válido hacia arriba por una escalera
        ficha.mover(pasos: 2, tablero: tablero)
        XCTAssertEqual(ficha.posicion, 16, "El token no se movió correctamente por la escalera.")
    }

    // Historia de usuario 5: Prueba para moverse hacia abajo por una serpiente
    func testMoverFichaAbajoPorSerpiente() {
        let ficha = Ficha(posicionInicial: 60)
        let tablero = [3: 16, 15: 10, 23: 29, 42: 81, 56: 75, 62: 18, 64: 60, 87: 49, 93: 71, 95: 73, 98: 78]

        // Prueba para un movimiento válido hacia abajo por una serpiente
        ficha.mover(pasos: 2, tablero: tablero)
        XCTAssertEqual(ficha.posicion, 18, "El token no se movió correctamente por la serpiente.")
    }

    // Prueba de dado
    func testLanzamientoDeDado() {
        let dado = Dado()
        let lanzamiento = dado.lanzar()

        // Prueba para lanzamiento válido
        XCTAssertTrue(1 <= lanzamiento && lanzamiento <= 6, "El lanzamiento del dado debería estar entre 1 y 6 inclusive.")

        // Prueba para lanzamiento inválido
        XCTAssertFalse(lanzamiento < 1 || lanzamiento > 6, "El lanzamiento del dado no debería estar fuera del rango de 1-6.")
    }
    
    //Creación de Jugadores
    func testCrearJugadores() {
        let nombresJugadores = ["Alice", "Bob"]

        let tablero = [3: 16, 15: 10, 23: 29, 42: 81, 56: 75, 62: 18, 64: 60, 87: 49, 93: 71, 95: 73, 98: 78]

        // Prueba para crear una cantidad válida de jugadores con nombres únicos
        let juego = Juego(tablero: tablero)
        juego.crearJugadores(cantidad: 2, nombres: nombresJugadores)
        XCTAssertEqual(juego.jugadores.count, 2, "La cantidad de jugadores creados no es correcta.")
        XCTAssertEqual(juego.jugadores[0].nombre, "Alice", "El nombre del primer jugador no es correcto.")
        XCTAssertEqual(juego.jugadores[1].nombre, "Bob", "El nombre del segundo jugador no es correcto.")

        // Prueba para crear jugadores con una cantidad de nombres incorrecta
        let juego2 = Juego(tablero: tablero)
        juego2.crearJugadores(cantidad: 2, nombres: ["SoloUnJugador"])
        XCTAssertTrue(juego2.jugadores.isEmpty, "No se deberían haber creado jugadores.")
    }
}
