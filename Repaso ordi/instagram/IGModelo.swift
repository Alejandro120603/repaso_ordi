//
//  IGModelo.swift
//  Repaso ordi — Práctica 2: fotos e historias (carpeta instagram)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: MODEL.
//  Los "moldes" de los datos: historia, publicación y perfil.
//  Solo guardan datos. Los datos inventados están en IGViewModel.swift.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI   // por el tipo Color

// MARK: - IGHistoria

// TEMA: MVVM (Model)
struct IGHistoria: Identifiable {
    let id = UUID()
    let usuario: String      // "luna.viajes"
    let iniciales: String    // "LV"
    let color: Color         // color del círculo y del fondo de la historia
    let icono: String        // SF Symbol que se ve dentro de la historia
    let texto: String        // texto de la historia

    // "var": cambia a true cuando la abro (Requisito 3)
    var vista: Bool
}

// MARK: - IGPublicacion

struct IGPublicacion: Identifiable {
    let id = UUID()
    let usuario: String
    let iniciales: String
    let colorAvatar: Color
    let colorImagen: Color   // la "foto" es un cuadrado de este color
    let icono: String        // SF Symbol encima de la "foto"
    let descripcion: String

    // "var": los cambian los botones con @Binding
    var meGustas: Int
    var leDiMeGusta: Bool
    var guardada: Bool
}

// MARK: - IGPerfil

struct IGPerfil {
    let usuario: String          // "cami.dibuja"
    let nombre: String           // "Camila Torres"
    let iniciales: String
    let color: Color
    let biografia: String
    let seguidos: Int
    let fotos: [Color]           // la cuadrícula: un color por foto

    // "var": los cambia el botón Seguir (con @Binding)
    var seguidores: Int
    var siguiendo: Bool
}
