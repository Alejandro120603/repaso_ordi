//
//  Modelo.swift
//  Repaso ordi — Segundo parcial (Baticave)
//
//  ===================  M O D E L  (la "M" de MVVM)  ===================
//
//  ¿Qué es el Model?
//  Son los "moldes" de los datos: cómo es un capítulo, un cómic, una reacción.
//  Son structs sencillos: solo guardan datos.
//  NO dibujan nada (no tienen "body") y NO tienen lógica de la app.
//
//  Los datos REALES (los 5 cómics y las 7 reacciones) NO están aquí:
//  están en el ViewModel (BaticaveViewModel.swift).
//
//  MVVM en una frase:
//    Model     = los datos (este archivo)
//    ViewModel = guarda los datos y tiene la lógica (BaticaveViewModel.swift)
//    View      = solo muestra lo que el ViewModel tiene (InicioView, DetalleView...)
//

import SwiftUI

// MARK: - Capitulo

// struct: un "molde" para guardar datos juntos.
//
// Identifiable: le dice a SwiftUI que cada capítulo tiene un "id" único.
// Lo necesitan List y ForEach para saber cuál fila es cuál.
struct Capitulo: Identifiable {
    let id = UUID()        // UUID(): genera un identificador único automático
    let numero: Int        // número de capítulo (ej. 101)
    let paginas: Int       // cantidad de páginas (ej. 50)

    // "var" (no "let") porque el usuario puede cambiarlo tocando el corazón.
    // El valor que le damos en el ViewModel es el favorito INICIAL del anexo.
    var esFavorito: Bool
}

// MARK: - Comic

struct Comic: Identifiable {
    let id = UUID()
    let nombre: String          // texto que se muestra (ej. "Spiderman")
    let imagen: String          // nombre EXACTO de la imagen en Assets.xcassets
    let sinopsis: String        // descripción del cómic (Requisito 8)

    // [Capitulo] = un arreglo (lista) de capítulos.
    // "var" porque adentro cambian los favoritos.
    var capitulos: [Capitulo]

    // Nombre de la reacción que el usuario eligió para ESTE cómic.
    // "" (texto vacío) = ninguna reacción seleccionada.
    // Requisito 14: es UN solo texto, así que solo cabe UNA reacción a la vez.
    // Como cada cómic tiene la suya, elegir "Like" en Spiderman
    // no la marca en SuperMan.
    var reaccion: String = ""
}

// MARK: - Reaccion

// Cada reacción tiene el nombre que se ve (ej. "Hug")
// y el nombre de su imagen en Assets (ej. "meimporta").
struct Reaccion: Identifiable {
    let id = UUID()
    let nombre: String
    let imagen: String
}
