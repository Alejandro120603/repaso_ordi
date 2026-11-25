//
//  YTViewModel.swift
//  Repaso ordi — Práctica 5: videos (carpeta youtube)
//

import SwiftUI

// ROL EN MVVM: VIEWMODEL. Dueño de los datos de las tres pestañas.
@MainActor
@Observable
class YTViewModel {
    // Datos de ejemplo e imágenes que ya existen en Assets.xcassets.
    var videos: [YTVideo] = [
        YTVideo(titulo: "La historia de Batman", canal: "Baticave", imagen: "batman", duracion: "12:30", vistas: "15 mil vistas", meGusta: false, guardado: false),
        YTVideo(titulo: "Las aventuras de Superman", canal: "Héroes", imagen: "superman", duracion: "8:20", vistas: "9 mil vistas", meGusta: false, guardado: false),
        YTVideo(titulo: "Los mejores momentos de Spider-Man", canal: "Héroes", imagen: "spiderman", duracion: "15:42", vistas: "22 mil vistas", meGusta: true, guardado: false),
        YTVideo(titulo: "Flash: el más rápido", canal: "Héroes", imagen: "flash", duracion: "6:15", vistas: "7 mil vistas", meGusta: false, guardado: true),
        YTVideo(titulo: "Una aventura con Sonic", canal: "Videojuegos", imagen: "sonic", duracion: "10:05", vistas: "12 mil vistas", meGusta: false, guardado: false)
    ]

    // TEMA: funciones y arreglos. Biblioteca lee los videos marcados.
    func videosGuardados() -> [YTVideo] {
        var resultado: [YTVideo] = []
        for video in videos {
            if video.guardado {
                resultado.append(video)
            }
        }
        return resultado
    }
}
