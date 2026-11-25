//
//  SPContentView.swift
//  Repaso ordi — Práctica 3: música (carpeta spotify)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pantalla principal con las pestañas).
//  - CREA el ViewModel (es su dueño).
//  - Arma las 3 pestañas: Inicio, Buscar y Biblioteca.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct SPContentView: View {

    // TEMA: MVVM + @State — el ViewModel se crea aquí una sola vez
    @State private var viewModel = SPViewModel()

    var body: some View {

        // TEMA: Tabs — Requisito 1
        TabView {

            // Inicio CAMBIA los Me gusta de las canciones → recibe las
            // playlists con $ (Binding). El saludo solo lo lee.
            SPInicioView(saludo: viewModel.saludo,
                         paraTi: $viewModel.paraTi,
                         recientes: $viewModel.recientes)
                .tabItem {
                    Label("Inicio", systemImage: "house.fill")
                }

            // Buscar solo LEE las categorías
            SPBuscarView(categorias: viewModel.categorias)
                .tabItem {
                    Label("Buscar", systemImage: "magnifyingglass")
                }

            // Biblioteca recibe el MISMO ViewModel para leer las canciones
            // marcadas (Requisito 6). Solo lee y llama una función: no necesita $.
            SPBibliotecaView(viewModel: viewModel)
                .tabItem {
                    Label("Biblioteca", systemImage: "books.vertical.fill")
                }
        }
    }
}

#Preview {
    SPContentView()
}
