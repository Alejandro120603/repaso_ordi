//
//  SPBotonPlay.swift
//  Repaso ordi — Práctica 3: música (carpeta spotify)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (componente con @Binding).
//  Requisito 5: botón play/pausa. Cambia el ícono entre "play.fill" y
//  "pause.fill" con animación. Se usa en el detalle y en el reproductor.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct SPBotonPlay: View {

    // TEMA: @Binding
    // DUEÑO: la pantalla que lo usa (@State en SPPlaylistDetalleView o en
    // SPReproductorView). Este botón solo lo MODIFICA.
    @Binding var reproduciendo: Bool

    // TEMA: parámetros — diámetro del círculo
    var tamano: Double = 60

    var body: some View {
        Button {
            // TEMA: withAnimation — el cambio de ícono se anima
            withAnimation {
                reproduciendo.toggle()
            }
        } label: {
            // ZStack: círculo verde atrás, ícono adelante
            ZStack {
                Circle()
                    .fill(Color.green)
                    .frame(width: tamano, height: tamano)
                Image(systemName: reproduciendo ? "pause.fill" : "play.fill")
                    .font(.system(size: tamano * 0.4))
                    .foregroundStyle(.black)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HStack(spacing: 20) {
        SPBotonPlay(reproduciendo: .constant(false))
        SPBotonPlay(reproduciendo: .constant(true), tamano: 80)
    }
}
