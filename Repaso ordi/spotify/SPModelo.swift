//
//  SPModelo.swift
//  Repaso ordi — Práctica 3: música (carpeta spotify)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: MODEL.
//  Los "moldes" de los datos: canción, playlist y categoría de búsqueda.
//  Solo guardan datos. Los datos inventados están en SPViewModel.swift.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI   // por el tipo Color

// MARK: - SPCancion

// TEMA: MVVM (Model)
struct SPCancion: Identifiable {
    let id = UUID()
    let titulo: String       // "Luces de neón"
    let artista: String      // "Los Satélites"
    let duracion: String     // "3:24"

    // "var": lo cambia el corazón (con @Binding)
    var meGusta: Bool
}

// MARK: - SPPlaylist

struct SPPlaylist: Identifiable {
    let id = UUID()
    let nombre: String
    let descripcion: String
    let color: Color         // la portada es un cuadrado de este color
    let icono: String        // SF Symbol encima de la portada

    // "var" porque adentro cambian los Me gusta de las canciones
    var canciones: [SPCancion]
}

// MARK: - SPCategoria (pestaña Buscar)

struct SPCategoria: Identifiable {
    let id = UUID()
    let nombre: String
    let color: Color
    let icono: String
}
