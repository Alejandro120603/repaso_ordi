//
//  IGBotonGuardar.swift
//  Repaso ordi — Práctica 2: fotos e historias (carpeta instagram)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (componente con @Binding).
//  Requisito 5: el botón de guardar (marcador) de una publicación.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct IGBotonGuardar: View {

    // TEMA: @Binding
    // DUEÑO: IGViewModel (publicaciones[i].guardada).
    // Este botón solo lo MODIFICA.
    @Binding var guardada: Bool

    var body: some View {
        Button {
            withAnimation {
                guardada.toggle()   // true ↔ false
            }
        } label: {
            // "bookmark.fill" (relleno) si está guardada, "bookmark" si no
            Image(systemName: guardada ? "bookmark.fill" : "bookmark")
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HStack(spacing: 20) {
        IGBotonGuardar(guardada: .constant(false))
        IGBotonGuardar(guardada: .constant(true))
    }
    .font(.largeTitle)
}
