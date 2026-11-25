//
//  YTModelo.swift
//  Repaso ordi — Práctica 5: videos (carpeta youtube)
//

import SwiftUI

// ROL EN MVVM: MODEL. Solo guarda los datos del video.
struct YTVideo: Identifiable {
    let id = UUID()
    let titulo: String
    let canal: String
    let imagen: String
    let duracion: String
    let vistas: String
    var meGusta: Bool
    var guardado: Bool
}
