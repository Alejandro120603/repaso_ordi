//
//  FBAvatarView.swift
//  Repaso ordi — Práctica 1: red social con feed (carpeta facebook)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (componente reutilizable, sin @Binding).
//  La "foto de perfil": un círculo de color con las iniciales.
//  Se usa en la caja de Inicio, en cada publicación, en Amigos y en Perfil.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct FBAvatarView: View {

    // TEMA: parámetros
    let usuario: FBUsuario   // de quién es la foto
    var tamano: Double = 44  // diámetro del círculo (44 si no se manda)

    var body: some View {
        // Circle con color de fondo y las iniciales ENCIMA (.overlay)
        Circle()
            .fill(usuario.color)
            .frame(width: tamano, height: tamano)
            .overlay(
                Text(usuario.iniciales)
                    // la letra crece junto con el círculo
                    .font(.system(size: tamano * 0.4))
                    .bold()
                    .foregroundStyle(.white)
            )
    }
}

#Preview {
    HStack {
        FBAvatarView(usuario: FBViewModel().yo)
        FBAvatarView(usuario: FBViewModel().yo, tamano: 100)
    }
}
