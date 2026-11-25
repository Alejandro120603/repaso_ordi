//
//  IGAvatarView.swift
//  Repaso ordi — Práctica 2: fotos e historias (carpeta instagram)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (componente reutilizable, sin @Binding).
//  Foto de perfil: círculo de color con iniciales.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct IGAvatarView: View {

    // TEMA: parámetros
    let iniciales: String
    let color: Color
    var tamano: Double = 40

    var body: some View {
        Circle()
            .fill(color)
            .frame(width: tamano, height: tamano)
            .overlay(
                Text(iniciales)
                    .font(.system(size: tamano * 0.4))
                    .bold()
                    .foregroundStyle(.white)
            )
    }
}

#Preview {
    IGAvatarView(iniciales: "CT", color: .purple, tamano: 80)
}
