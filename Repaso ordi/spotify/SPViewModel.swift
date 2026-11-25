//
//  SPViewModel.swift
//  Repaso ordi — Práctica 3: música (carpeta spotify)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEWMODEL.
//  DUEÑO de los datos (inventados): el saludo, las playlists de las dos
//  secciones (con sus canciones y Me gusta) y las categorías de Buscar.
//  Lógica: cancionesQueMeGustan() junta las canciones marcadas para la
//  pestaña Biblioteca.
//  Estilo del profesor: clase con @Observable y @MainActor.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

// TEMA: MVVM (ViewModel)
@MainActor
@Observable
class SPViewModel {

    let saludo = "¡Buenas tardes!"

    // ---------- Sección 1: "Hechas para ti" ----------
    var paraTi: [SPPlaylist] = [
        SPPlaylist(nombre: "Mix para estudiar", descripcion: "Música tranquila para concentrarte.",
                   color: .indigo, icono: "book.fill", canciones: [
                    SPCancion(titulo: "Lluvia en la ventana", artista: "Nube Lenta", duracion: "3:12", meGusta: false),
                    SPCancion(titulo: "Café de medianoche", artista: "Trío Brújula", duracion: "4:05", meGusta: true),
                    SPCancion(titulo: "Páginas en blanco", artista: "Nube Lenta", duracion: "2:48", meGusta: false),
                    SPCancion(titulo: "Respira", artista: "Marea Alta", duracion: "3:30", meGusta: false)
                   ]),
        SPPlaylist(nombre: "Energía total", descripcion: "Para correr o ir al gimnasio.",
                   color: .orange, icono: "bolt.fill", canciones: [
                    SPCancion(titulo: "Sin frenos", artista: "Los Satélites", duracion: "3:01", meGusta: false),
                    SPCancion(titulo: "Kilómetro 10", artista: "Pulso", duracion: "2:55", meGusta: false),
                    SPCancion(titulo: "Fuego lento", artista: "Volcán Azul", duracion: "3:44", meGusta: true)
                   ]),
        SPPlaylist(nombre: "Noche de viaje", descripcion: "Canciones para la carretera.",
                   color: .teal, icono: "car.fill", canciones: [
                    SPCancion(titulo: "Luces de neón", artista: "Los Satélites", duracion: "3:24", meGusta: false),
                    SPCancion(titulo: "Kilómetros", artista: "Ruta 66 MX", duracion: "4:10", meGusta: false),
                    SPCancion(titulo: "Horizonte", artista: "Marea Alta", duracion: "3:58", meGusta: false)
                   ])
    ]

    // ---------- Sección 2: "Escuchado recientemente" ----------
    var recientes: [SPPlaylist] = [
        SPPlaylist(nombre: "Clásicos del rock", descripcion: "Guitarras que nunca pasan de moda.",
                   color: .red, icono: "guitars.fill", canciones: [
                    SPCancion(titulo: "Trueno", artista: "Los Truenos", duracion: "4:22", meGusta: false),
                    SPCancion(titulo: "Carretera vieja", artista: "Volcán Azul", duracion: "3:50", meGusta: false),
                    SPCancion(titulo: "Último acorde", artista: "Los Truenos", duracion: "5:01", meGusta: false)
                   ]),
        SPPlaylist(nombre: "Pop en español", descripcion: "Lo más escuchado de la semana.",
                   color: .pink, icono: "music.mic", canciones: [
                    SPCancion(titulo: "Tu nombre", artista: "Sol y Luna", duracion: "3:15", meGusta: true),
                    SPCancion(titulo: "Verano", artista: "Brisa", duracion: "2:59", meGusta: false),
                    SPCancion(titulo: "Bailando sola", artista: "Sol y Luna", duracion: "3:33", meGusta: false)
                   ]),
        SPPlaylist(nombre: "Lo-fi para dormir", descripcion: "Sonidos suaves para descansar.",
                   color: .purple, icono: "moon.stars.fill", canciones: [
                    SPCancion(titulo: "Estrellas", artista: "Nube Lenta", duracion: "3:40", meGusta: false),
                    SPCancion(titulo: "Silencio", artista: "Marea Alta", duracion: "4:02", meGusta: false)
                   ])
    ]

    // ---------- Categorías de la pestaña Buscar ----------
    let categorias: [SPCategoria] = [
        SPCategoria(nombre: "Pop", color: .pink, icono: "music.mic"),
        SPCategoria(nombre: "Rock", color: .red, icono: "guitars.fill"),
        SPCategoria(nombre: "Relajación", color: .teal, icono: "leaf.fill"),
        SPCategoria(nombre: "Ejercicio", color: .orange, icono: "figure.run"),
        SPCategoria(nombre: "Estudio", color: .indigo, icono: "book.fill"),
        SPCategoria(nombre: "Fiesta", color: .purple, icono: "sparkles")
    ]

    // MARK: - Lógica

    // Junta TODAS las canciones con meGusta == true de las dos secciones.
    // La usa la pestaña Biblioteca. Como lee "paraTi" y "recientes", si
    // marcas un corazón, Biblioteca se actualiza sola (@Observable).
    func cancionesQueMeGustan() -> [SPCancion] {
        var resultado: [SPCancion] = []

        // recorre cada playlist y, dentro, cada canción
        for playlist in paraTi {
            for cancion in playlist.canciones {
                if cancion.meGusta {
                    resultado.append(cancion)
                }
            }
        }
        for playlist in recientes {
            for cancion in playlist.canciones {
                if cancion.meGusta {
                    resultado.append(cancion)
                }
            }
        }
        return resultado
    }
}
