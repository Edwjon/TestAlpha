# TestAlpha

Este proyecto es una implementación del clásico juego de mesa "Serpientes y Escaleras" en Swift. 

## Descripción

El juego permite a los jugadores mover sus fichas a lo largo de un tablero con 100 casillas, desde la casilla 1 hasta la casilla 100. El objetivo del juego es ser el primer jugador en llegar a la casilla 100.

El juego incluye características especiales:

- Las "escaleras" permiten a los jugadores avanzar rápidamente a través del tablero.
- Las "serpientes" hacen que los jugadores retrocedan en el tablero.
- Los movimientos se determinan mediante el lanzamiento de un dado.

## Instalación y ejecución

El proyecto fue desarrollado en Swift y debe ser ejecutado en un ambiente que soporte Swift. Se recomienda usar Xcode para abrir y ejecutar el proyecto.

Para ejecutar el proyecto:

1. Clona este repositorio a tu máquina local.
2. Abre el archivo `.xcodeproj` en Xcode.
3. Selecciona el esquema `TestAlpha` y presiona el botón de `Play` para compilar y ejecutar el proyecto.

Para ejecutar las pruebas unitarias:

1. Abre el proyecto en Xcode.
2. Navega a la pestaña de pruebas `GameTests`, en el archivo `JuegoTests`
3. Haz click en el botón de `Play` al lado del conjunto de pruebas que deseas ejecutar.

## Estructura del Proyecto

El proyecto consta de varias clases:

- `Ficha`: Representa una ficha en el juego que se mueve a lo largo del tablero.
- `Jugador`: Representa a un jugador en el juego. Cada jugador tiene una ficha.
- `Dado`: Se utiliza para lanzar un dado de seis caras.
- `Juego`: La clase principal que orquesta el juego. 

Además, el proyecto incluye pruebas unitarias para validar la lógica del juego.
