//
//  SPBibliotecaView.swift
//  Repaso ordi — Práctica 3: música (carpeta spotify)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pestaña Biblioteca).
//  Requisito 6: muestra SOLO las canciones marcadas con corazón, leyendo
//  el MISMO ViewModel que usa Inicio. No guarda nada propio.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct SPBibliotecaView: View {

    // TEMA: MVVM
    // Recibe el ViewModel como parámetro normal (sin @Binding) porque solo
    // LEE datos y llama una función; no le presta nada a ningún botón.
    // Aun así se actualiza sola: @Observable avisa cuando cambia un Me gusta.
    let viewModel: SPViewModel

    var body: some View {

        // Le pedimos al ViewModel la lista ya filtrada
        let canciones = viewModel.cancionesQueMeGustan()

        NavigationStack {
            VStack {
                if canciones.count == 0 {
                    // Mensaje si todavía no hay canciones marcadas
                    VStack(spacing: 12) {
                        Image(systemName: "heart")
                            .font(.largeTitle)
                        Text("Aún no tienes canciones que te gusten.")
                    }
                    .foregroundStyle(.gray)
                } else {
                    // List: una fila por cada canción marcada
                    List(canciones) { cancion in
                        HStack(spacing: 12) {
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.green)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(cancion.titulo)
                                    .font(.headline)
                                Text(cancion.artista)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            Spacer()
                            Text(cancion.duracion)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Tu música")
        }
    }
}

#Preview {
    SPBibliotecaView(viewModel: SPViewModel())
}
