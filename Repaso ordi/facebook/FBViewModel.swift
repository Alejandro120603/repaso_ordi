//
//  FBViewModel.swift
//  Repaso ordi — Práctica 1: red social con feed (carpeta facebook)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEWMODEL.
//  Guarda TODOS los datos de la práctica (inventados, sin API):
//   - el usuario actual (yo)
//   - la lista de amigos
//   - las publicaciones del feed (con su contador de Me gusta)
//  Es el DUEÑO de esos datos. Las vistas solo los muestran, y los botones
//  con @Binding los modifican "prestados".
//
//  Mismo estilo que el profesor (repaso/Api/Pokedex/PokemonListViewModel):
//  una clase con @Observable y @MainActor.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

// TEMA: MVVM (ViewModel)
// @MainActor: todo corre en el hilo principal (el de la pantalla).
// @Observable: cuando cambia una propiedad (por ejemplo un contador de
// Me gusta), las vistas que la muestran se vuelven a dibujar solas.
// class (no struct): para que todas las pantallas compartan los MISMOS datos.
@MainActor
@Observable
class FBViewModel {

    // "let" = no cambia nunca. "var" = puede cambiar.
    let yo: FBUsuario
    let amigos: [FBUsuario]
    var publicaciones: [FBPublicacion]   // cambia: los Me gusta

    // init: se ejecuta UNA vez, al crear el ViewModel.
    // Lo usamos porque las publicaciones necesitan a los usuarios ya creados
    // (cada publicación guarda a su autor).
    init() {

        // ---------- Usuarios inventados ----------
        let alex = FBUsuario(nombre: "Alex Rivera", iniciales: "AR", color: .blue,
                             ciudad: "Monterrey", biografia: "Estudiante de sistemas. Me gusta programar apps.", amigos: 312)
        let ana = FBUsuario(nombre: "Ana López", iniciales: "AL", color: .pink,
                            ciudad: "Guadalajara", biografia: "Fotografía, café y viajes.", amigos: 540)
        let carlos = FBUsuario(nombre: "Carlos Ruiz", iniciales: "CR", color: .orange,
                               ciudad: "Puebla", biografia: "Fan del fútbol y de la pizza.", amigos: 205)
        let maria = FBUsuario(nombre: "María Fernández", iniciales: "MF", color: .purple,
                              ciudad: "Querétaro", biografia: "Diseñadora gráfica.", amigos: 880)
        let luis = FBUsuario(nombre: "Luis Pérez", iniciales: "LP", color: .green,
                             ciudad: "Mérida", biografia: "Corredor de fin de semana.", amigos: 150)
        let sofia = FBUsuario(nombre: "Sofía Martínez", iniciales: "SM", color: .teal,
                              ciudad: "León", biografia: "Leo un libro por semana.", amigos: 430)

        yo = alex
        amigos = [ana, carlos, maria, luis, sofia]

        // ---------- Publicaciones inventadas ----------
        publicaciones = [
            FBPublicacion(autor: ana, hora: "Hace 15 min",
                          texto: "¡Qué bonito atardecer hoy en la playa! 🌅",
                          colorImagen: .orange, icono: "sun.horizon.fill",
                          comentarios: 8, meGustas: 42, leDiMeGusta: false),
            FBPublicacion(autor: carlos, hora: "Hace 1 h",
                          texto: "Ya casi termino mi proyecto de SwiftUI. ¿Quién más está estudiando para el ordinario?",
                          colorImagen: .indigo, icono: "laptopcomputer",
                          comentarios: 15, meGustas: 27, leDiMeGusta: true),
            FBPublicacion(autor: maria, hora: "Hace 3 h",
                          texto: "Nuevo diseño terminado. Me encantó cómo quedaron los colores.",
                          colorImagen: .pink, icono: "paintpalette.fill",
                          comentarios: 4, meGustas: 63, leDiMeGusta: false),
            FBPublicacion(autor: luis, hora: "Ayer",
                          texto: "10 km antes del desayuno 🏃‍♂️",
                          colorImagen: .green, icono: "figure.run",
                          comentarios: 2, meGustas: 18, leDiMeGusta: false),
            FBPublicacion(autor: sofia, hora: "Hace 2 días",
                          texto: "Recomiendo muchísimo el libro que acabo de terminar.",
                          colorImagen: .teal, icono: "book.fill",
                          comentarios: 11, meGustas: 35, leDiMeGusta: false)
        ]
    }
}
