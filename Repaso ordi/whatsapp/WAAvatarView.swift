//
//  WAAvatarView.swift
//  Repaso ordi — Práctica 4: mensajería (carpeta whatsapp)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (componente reutilizable, sin @Binding).
//  Foto de perfil: círculo de color con iniciales.
//  Se usa en Chats, Novedades y Llamadas.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct WAAvatarView: View {

    // TEMA: parámetros
    let iniciales: String
    let color: Color
    var tamano: Double = 50

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
    WAAvatarView(iniciales: "AL", color: .purple, tamano: 80)
}
