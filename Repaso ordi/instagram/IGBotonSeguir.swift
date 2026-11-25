//
//  IGBotonSeguir.swift
//  Repaso ordi — Práctica 2: fotos e historias (carpeta instagram)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (componente con @Binding).
//  Requisito 6: botón "Seguir" que cambia a "Siguiendo".
//  También suma o resta 1 a los seguidores, para que se note el cambio.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct IGBotonSeguir: View {

    // TEMA: @Binding
    // DUEÑO: IGViewModel (perfil.siguiendo y perfil.seguidores).
    // Este botón solo los MODIFICA.
    @Binding var siguiendo: Bool
    @Binding var seguidores: Int

    var body: some View {
        Button {
            withAnimation {
                if siguiendo {
                    siguiendo = false
                    seguidores -= 1
                } else {
                    siguiendo = true
                    seguidores += 1
                }
            }
        } label: {
            Text(siguiendo ? "Siguiendo" : "Seguir")
                .bold()
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                // azul con letra blanca si NO lo sigo; gris con letra normal si ya lo sigo
                .foregroundStyle(siguiendo ? Color.primary : Color.white)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(siguiendo ? Color.gray.opacity(0.25) : Color.blue)
                )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack(spacing: 20) {
        IGBotonSeguir(siguiendo: .constant(false), seguidores: .constant(100))
        IGBotonSeguir(siguiendo: .constant(true), seguidores: .constant(101))
    }
    .padding()
}
