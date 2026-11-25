//
//  IGBotonCorazon.swift
//  Repaso ordi — Práctica 2: fotos e historias (carpeta instagram)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (componente con @Binding).
//  Requisito 5: el corazón de Me gusta de una publicación.
//  Al tocarlo: corazón vacío ↔ rojo, y el contador sube o baja en 1.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct IGBotonCorazon: View {

    // TEMA: @Binding
    // DUEÑO: IGViewModel (publicaciones[i].leDiMeGusta y .meGustas).
    // Este botón solo los MODIFICA.
    @Binding var leDiMeGusta: Bool
    @Binding var meGustas: Int

    var body: some View {
        Button {
            // TEMA: withAnimation
            withAnimation {
                if leDiMeGusta {
                    leDiMeGusta = false
                    meGustas -= 1
                } else {
                    leDiMeGusta = true
                    meGustas += 1
                }
            }
        } label: {
            Image(systemName: leDiMeGusta ? "heart.fill" : "heart")
                .foregroundStyle(leDiMeGusta ? Color.red : Color.primary)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HStack(spacing: 20) {
        IGBotonCorazon(leDiMeGusta: .constant(false), meGustas: .constant(5))
        IGBotonCorazon(leDiMeGusta: .constant(true), meGustas: .constant(6))
    }
    .font(.largeTitle)
}
