//
//  SPPortadaView.swift
//  Repaso ordi — Práctica 3: música (carpeta spotify)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (componente reutilizable, sin @Binding).
//  Portada de una playlist: cuadrado redondeado de color con un ícono.
//  Se usa en Inicio (chica), en el detalle y en el reproductor (grande).
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct SPPortadaView: View {

    // TEMA: parámetros
    let color: Color
    let icono: String
    var tamano: Double = 140

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(color)
            .frame(width: tamano, height: tamano)
            // ícono encima, proporcional al tamaño de la portada
            .overlay(
                Image(systemName: icono)
                    .font(.system(size: tamano * 0.35))
                    .foregroundStyle(.white)
            )
    }
}

#Preview {
    SPPortadaView(color: .indigo, icono: "book.fill", tamano: 200)
}
