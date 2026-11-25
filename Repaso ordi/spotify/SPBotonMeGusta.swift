//
//  SPBotonMeGusta.swift
//  Repaso ordi — Práctica 3: música (carpeta spotify)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (componente con @Binding).
//  Requisito 6: corazón de Me gusta de una canción. Las canciones marcadas
//  aparecen en la pestaña Biblioteca.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct SPBotonMeGusta: View {

    // TEMA: @Binding
    // DUEÑO: SPViewModel (playlist.canciones[i].meGusta).
    // Este botón solo lo MODIFICA. Como el dato vive en el ViewModel,
    // Biblioteca (que lee el mismo ViewModel) se entera del cambio.
    @Binding var meGusta: Bool

    var body: some View {
        Button {
            withAnimation {
                meGusta.toggle()
            }
        } label: {
            Image(systemName: meGusta ? "heart.fill" : "heart")
                .font(.title3)
                .foregroundStyle(meGusta ? Color.green : Color.gray)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HStack(spacing: 20) {
        SPBotonMeGusta(meGusta: .constant(false))
        SPBotonMeGusta(meGusta: .constant(true))
    }
}
