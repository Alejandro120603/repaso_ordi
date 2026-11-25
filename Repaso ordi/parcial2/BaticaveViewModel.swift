//
//  BaticaveViewModel.swift
//  Repaso ordi — Segundo parcial (Baticave)
//
//  ===============  V I E W M O D E L  (la "VM" de MVVM)  ===============
//
//  ¿Qué es el ViewModel?
//  Es el "cerebro" de la app. Es una CLASE (no un struct) que:
//    1. GUARDA los datos: los 5 cómics y las 7 reacciones del anexo.
//    2. Tiene la LÓGICA: qué pasa cuando tocas una reacción.
//
//  Las vistas NO deciden nada: solo muestran lo que hay aquí
//  y le avisan al ViewModel cuando el usuario toca algo.
//
//  ¿Por qué una clase?
//  Porque TODAS las pantallas comparten el MISMO ViewModel.
//  Una clase se comparte (todas apuntan al mismo objeto);
//  un struct se copiaría y cada pantalla tendría su propia copia.
//

import SwiftUI

// ObservableObject: permite que las vistas "observen" esta clase.
// Cuando algo marcado con @Published cambia, las vistas que la usan
// se vuelven a dibujar solas (igual que pasa con @State en una vista).
class BaticaveViewModel: ObservableObject {

    // MARK: - Datos

    // @Published: "avisa a las vistas cuando cambie".
    // Cambia cuando el usuario elige una reacción o toca un corazón.
    //
    // El ORDEN de los capítulos y las páginas es el mismo que en el anexo.
    @Published var comics: [Comic] = [

        // Spiderman: capítulos 1–5, favoritos el 2 y el 5
        Comic(
            nombre: "Spiderman",
            imagen: "spiderman",
            sinopsis: "Un estudiante ejemplar es picado por una araña ahora puede trepar paredes.",
            capitulos: [
                Capitulo(numero: 1, paginas: 20, esFavorito: false),
                Capitulo(numero: 2, paginas: 34, esFavorito: true),
                Capitulo(numero: 3, paginas: 45, esFavorito: false),
                Capitulo(numero: 4, paginas: 56, esFavorito: false),
                Capitulo(numero: 5, paginas: 78, esFavorito: true)
            ]
        ),

        // SuperMan: capítulos 101–105, favoritos el 103, 104 y 105
        Comic(
            nombre: "SuperMan",
            imagen: "superman",
            sinopsis: "Un alienígena amigable casi invencible se enamora de una reportera",
            capitulos: [
                Capitulo(numero: 101, paginas: 50, esFavorito: false),
                Capitulo(numero: 102, paginas: 44, esFavorito: false),
                Capitulo(numero: 103, paginas: 35, esFavorito: true),
                Capitulo(numero: 104, paginas: 26, esFavorito: true),
                Capitulo(numero: 105, paginas: 18, esFavorito: true)
            ]
        ),

        // Batman y Robin: capítulos 201–205, favorito solo el 201
        Comic(
            nombre: "Batman y Robin",
            imagen: "batman",
            sinopsis: "Un multimillonario adopta a un niño trapecista y pelean contra un guasón",
            capitulos: [
                Capitulo(numero: 201, paginas: 5, esFavorito: true),
                Capitulo(numero: 202, paginas: 4, esFavorito: false),
                Capitulo(numero: 203, paginas: 353, esFavorito: false),
                Capitulo(numero: 204, paginas: 23, esFavorito: false),
                Capitulo(numero: 205, paginas: 318, esFavorito: false)
            ]
        ),

        // Flash: capítulos 999 a 995 (en ese orden), 20 páginas cada uno, ningún favorito
        Comic(
            nombre: "Flash",
            imagen: "flash",
            sinopsis: "Un joven científico es golpeado por un rayo ahora es bien veloz",
            capitulos: [
                Capitulo(numero: 999, paginas: 20, esFavorito: false),
                Capitulo(numero: 998, paginas: 20, esFavorito: false),
                Capitulo(numero: 997, paginas: 20, esFavorito: false),
                Capitulo(numero: 996, paginas: 20, esFavorito: false),
                Capitulo(numero: 995, paginas: 20, esFavorito: false)
            ]
        ),

        // Sonic: capítulos 10–14, 15 páginas cada uno, todos favoritos
        Comic(
            nombre: "Sonic",
            imagen: "sonic",
            sinopsis: "Un erizo azul y sus amigos se enfrentan a un tal Dr Eggman",
            capitulos: [
                Capitulo(numero: 10, paginas: 15, esFavorito: true),
                Capitulo(numero: 11, paginas: 15, esFavorito: true),
                Capitulo(numero: 12, paginas: 15, esFavorito: true),
                Capitulo(numero: 13, paginas: 15, esFavorito: true),
                Capitulo(numero: 14, paginas: 15, esFavorito: true)
            ]
        )
    ]

    // Requisito 10: las 7 reacciones en el orden del examen.
    // "let" porque esta lista nunca cambia (no necesita @Published).
    // OJO: la imagen de "Hug" en los recursos se llama "meimporta"
    // (es la reacción "Me importa" de Facebook: la carita abrazando un corazón).
    let reacciones: [Reaccion] = [
        Reaccion(nombre: "Like", imagen: "like"),
        Reaccion(nombre: "Heart", imagen: "heart"),
        Reaccion(nombre: "Hug", imagen: "meimporta"),
        Reaccion(nombre: "Sad", imagen: "sad"),
        Reaccion(nombre: "Angry", imagen: "angry"),
        Reaccion(nombre: "Smile", imagen: "smile"),
        Reaccion(nombre: "Amazing", imagen: "amazing")
    ]

    // MARK: - Lógica

    // Se llama cuando el usuario toca una reacción.
    // - nombre: el nombre de la reacción tocada (ej. "Like")
    // - indiceComic: la posición del cómic en el arreglo (0 = Spiderman, 1 = SuperMan...)
    func tocarReaccion(_ nombre: String, indiceComic: Int) {

        // Requisito 15: si toco la que YA estaba elegida,
        // se deselecciona ("" = ninguna activa).
        if comics[indiceComic].reaccion == nombre {
            comics[indiceComic].reaccion = ""
        } else {
            // Requisito 14: si toco otra, esa pasa a ser la ÚNICA elegida
            // (reemplaza a la anterior, porque solo hay un texto donde guardarla).
            comics[indiceComic].reaccion = nombre
        }
        // Como "comics" es @Published, al cambiarlo la pantalla se redibuja sola.
    }

    // Responde true o false: ¿esta reacción es la elegida en este cómic?
    // La vista la usa para saber de qué color pintar el borde (Requisito 13).
    func estaSeleccionada(_ nombre: String, indiceComic: Int) -> Bool {
        return comics[indiceComic].reaccion == nombre
    }
}
