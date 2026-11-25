//
//  SPPlaylistDetalleView.swift
//  Repaso ordi — Práctica 3: música (carpeta spotify)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (detalle de una playlist).
//  Requisito 3: recibe la playlist seleccionada. Muestra portada grande,
//  nombre, descripción, botón de reproducir y la lista de canciones.
//  Requisito 4: tocar una canción abre el reproductor.
//  Requisito 6: cada canción tiene su corazón con @Binding.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct SPPlaylistDetalleView: View {

    // TEMA: @Binding
    // DUEÑO: SPViewModel. Esta pantalla recibe la playlist prestada para
    // que cada corazón cambie SU canción con $playlist.canciones[indice].meGusta
    @Binding var playlist: SPPlaylist

    // TEMA: @State
    // ¿Está sonando la playlist? DUEÑA: esta pantalla. Se lo presta al
    // botón de play con $reproduciendo.
    @State private var reproduciendo = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {

                // ---------- Portada grande, centrada ----------
                HStack {
                    Spacer()
                    SPPortadaView(color: playlist.color, icono: playlist.icono, tamano: 220)
                    Spacer()
                }

                // ---------- Nombre y descripción ----------
                Text(playlist.nombre)
                    .font(.title)
                    .bold()
                Text(playlist.descripcion)
                    .foregroundStyle(.gray)

                // ---------- Botón de reproducir (a la derecha) ----------
                HStack {
                    Text("\(playlist.canciones.count) canciones")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    Spacer()
                    // el MISMO componente que usa el reproductor
                    SPBotonPlay(reproduciendo: $reproduciendo, tamano: 56)
                }

                // ---------- Lista de canciones ----------
                ForEach(playlist.canciones.indices, id: \.self) { indice in

                    HStack(spacing: 12) {

                        // TEMA: Navigation — Requisito 4.
                        // Abre el reproductor con esta playlist, empezando
                        // en la canción tocada (indice).
                        NavigationLink {
                            SPReproductorView(playlist: playlist, indice: indice)
                        } label: {
                            HStack {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(playlist.canciones[indice].titulo)
                                        .font(.headline)
                                    Text(playlist.canciones[indice].artista)
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                                Spacer()
                                Text(playlist.canciones[indice].duracion)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                        }
                        .buttonStyle(.plain)

                        // Requisito 6: corazón con @Binding a ESTA canción
                        SPBotonMeGusta(meGusta: $playlist.canciones[indice].meGusta)
                    }
                    .padding(.vertical, 6)
                }
            }
            .padding()
        }
        .navigationTitle(playlist.nombre)
    }
}

#Preview {
    NavigationStack {
        SPPlaylistDetalleView(playlist: .constant(SPViewModel().paraTi[0]))
    }
}
