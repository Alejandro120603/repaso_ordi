//
//  SPSeccionView.swift
//  Repaso ordi — Práctica 3: música (carpeta spotify)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (componente con @Binding).
//  Una sección de Inicio: título + fila horizontal de playlists.
//  Tocar una playlist abre su detalle (Requisito 3).
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct SPSeccionView: View {

    // TEMA: parámetros
    let titulo: String

    // TEMA: @Binding
    // DUEÑO: SPViewModel (paraTi o recientes). Esta sección solo las recibe
    // prestadas para pasar UNA playlist al detalle con $playlists[indice].
    @Binding var playlists: [SPPlaylist]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            Text(titulo)
                .font(.title2)
                .bold()

            // Requisito 2: scroll horizontal de playlists
            ScrollView(.horizontal) {
                HStack(spacing: 16) {

                    ForEach(playlists.indices, id: \.self) { indice in

                        // TEMA: Navigation — Requisito 3.
                        // El detalle recibe ESA playlist con $ para poder
                        // cambiar los corazones de sus canciones.
                        NavigationLink {
                            SPPlaylistDetalleView(playlist: $playlists[indice])
                        } label: {
                            VStack(alignment: .leading, spacing: 6) {
                                // portada cuadrada redondeada (componente reutilizable)
                                SPPortadaView(color: playlists[indice].color,
                                              icono: playlists[indice].icono,
                                              tamano: 140)
                                // nombre debajo
                                Text(playlists[indice].nombre)
                                    .font(.subheadline)
                                    .bold()
                                    .frame(width: 140, alignment: .leading)
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SPSeccionView(titulo: "Hechas para ti", playlists: .constant(SPViewModel().paraTi))
            .padding()
    }
}
