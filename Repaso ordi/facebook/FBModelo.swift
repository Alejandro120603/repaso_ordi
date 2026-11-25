//
//  FBModelo.swift
//  Repaso ordi — Práctica 1: red social con feed (carpeta facebook)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: MODEL.
//  Los "moldes" de los datos: cómo es un usuario y cómo es una publicación.
//  Solo guardan datos: no dibujan nada ni tienen lógica.
//  Los datos REALES (inventados) están en FBViewModel.swift.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI   // se importa SwiftUI porque usamos el tipo Color

// MARK: - FBUsuario

// TEMA: MVVM (Model)
// Identifiable: List y ForEach necesitan un "id" único por elemento.
struct FBUsuario: Identifiable {
    let id = UUID()          // UUID(): identificador único automático
    let nombre: String       // "Ana López"
    let iniciales: String    // "AL" (va dentro del círculo de la foto)
    let color: Color         // color del círculo (en lugar de una foto real)
    let ciudad: String       // "Monterrey"
    let biografia: String    // texto corto del perfil
    let amigos: Int          // cuántos amigos tiene
}

// MARK: - FBPublicacion

struct FBPublicacion: Identifiable {
    let id = UUID()
    let autor: FBUsuario     // quién la publicó (un usuario completo)
    let hora: String         // "Hace 2 h"
    let texto: String        // lo que escribió
    let colorImagen: Color   // la "imagen" es un rectángulo de este color
    let icono: String        // SF Symbol que se dibuja encima de la imagen
    let comentarios: Int

    // "var" porque cambian cuando el usuario toca "Me gusta"
    var meGustas: Int        // contador de Me gusta
    var leDiMeGusta: Bool    // ¿yo ya le di Me gusta?
}
