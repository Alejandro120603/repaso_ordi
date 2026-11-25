//
//  SPInicioView.swift
//  Repaso ordi — Práctica 3: música (carpeta spotify)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pestaña Inicio).
//  Requisito 2: un saludo arriba y dos secciones con título, cada una con
//  un scroll horizontal de playlists (SPSeccionView).
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct SPInicioView: View {

    // TEMA: parámetros — el saludo (solo lectura)
    let saludo: String

    // TEMA: @Binding
    // DUEÑO: SPViewModel. Esta pantalla solo las recibe prestadas para
    // pasárselas a cada sección (y de ahí al detalle de la playlist).
    @Binding var paraTi: [SPPlaylist]
    @Binding var recientes: [SPPlaylist]

    var body: some View {

        // TEMA: Navigation — permite abrir playlist → reproductor
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    // Saludo
                    Text(saludo)
                        .font(.largeTitle)
                        .bold()

                    // Dos secciones: la MISMA vista con distintos parámetros
                    SPSeccionView(titulo: "Hechas para ti", playlists: $paraTi)
                    SPSeccionView(titulo: "Escuchado recientemente", playlists: $recientes)
                }
                .padding()
            }
            .navigationTitle("Inicio")
        }
    }
}

#Preview {
    SPInicioView(saludo: "¡Hola!",
                 paraTi: .constant(SPViewModel().paraTi),
                 recientes: .constant(SPViewModel().recientes))
}
