//
//  SPReproductorView.swift
//  Repaso ordi — Práctica 3: música (carpeta spotify)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pantalla de reproducción).
//  Requisito 4: portada grande, título, artista, barra de progreso hecha
//  con RoundedRectangle y botones anterior / play-pausa / siguiente.
//  Requisito 5: play/pausa es SPBotonPlay (vista aparte con @Binding).
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct SPReproductorView: View {

    // TEMA: parámetros — la playlist que se está escuchando (solo lectura)
    let playlist: SPPlaylist

    // TEMA: @State con valor inicial recibido como parámetro.
    // "indice" = posición de la canción que suena. Empieza en la que se
    // tocó (la manda el detalle) y cambia con anterior / siguiente.
    // DUEÑA: esta pantalla.
    @State var indice: Int

    // TEMA: @State — ¿está sonando? DUEÑA: esta pantalla.
    // Empieza en true: al abrir el reproductor, la canción "suena".
    @State private var sonando = true

    // Ancho total de la barra de progreso
    let anchoBarra = 280.0

    var body: some View {

        // La canción actual (cambia cuando cambia "indice")
        let cancion = playlist.canciones[indice]

        VStack(spacing: 24) {

            Spacer()

            // ---------- Portada grande ----------
            SPPortadaView(color: playlist.color, icono: playlist.icono, tamano: 260)

            // ---------- Título y artista ----------
            VStack(spacing: 4) {
                Text(cancion.titulo)
                    .font(.title)
                    .bold()
                Text(cancion.artista)
                    .foregroundStyle(.gray)
            }

            // ---------- Barra de progreso ----------
            VStack(spacing: 6) {
                // ZStack(alignment: .leading): dos barras encimadas, pegadas a la izquierda
                ZStack(alignment: .leading) {
                    // fondo gris (barra completa)
                    RoundedRectangle(cornerRadius: 3)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: anchoBarra, height: 6)
                    // parte "escuchada" (verde). Fija al 35% para practicar el diseño.
                    RoundedRectangle(cornerRadius: 3)
                        .fill(Color.green)
                        .frame(width: anchoBarra * 0.35, height: 6)
                }

                // tiempos debajo de la barra
                HStack {
                    Text("1:10")
                    Spacer()
                    Text(cancion.duracion)
                }
                .font(.caption)
                .foregroundStyle(.gray)
                .frame(width: anchoBarra)
            }

            // ---------- Controles ----------
            HStack(spacing: 40) {

                // Anterior: retrocede una canción (si no es la primera)
                Button {
                    if indice > 0 {
                        indice -= 1
                    }
                } label: {
                    Image(systemName: "backward.fill")
                        .font(.title)
                }
                .buttonStyle(.plain)

                // Requisito 5: play/pausa con @Binding a "sonando"
                SPBotonPlay(reproduciendo: $sonando, tamano: 72)

                // Siguiente: avanza una canción (si no es la última)
                Button {
                    if indice < playlist.canciones.count - 1 {
                        indice += 1
                    }
                } label: {
                    Image(systemName: "forward.fill")
                        .font(.title)
                }
                .buttonStyle(.plain)
            }

            Spacer()
        }
        .padding()
        .navigationTitle(playlist.nombre)
    }
}

#Preview {
    NavigationStack {
        SPReproductorView(playlist: SPViewModel().paraTi[0], indice: 0)
    }
}
