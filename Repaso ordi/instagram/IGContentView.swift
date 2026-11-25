//
//  IGContentView.swift
//  Repaso ordi — Práctica 2: fotos e historias (carpeta instagram)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pantalla principal con las pestañas).
//  - CREA el ViewModel (es su dueño).
//  - Arma las 3 pestañas: Inicio, Buscar y Perfil.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct IGContentView: View {

    // TEMA: MVVM + @State
    // El ViewModel se crea aquí una vez. El $ de @State nos deja prestar
    // sus datos con @Binding a las pestañas que los cambian.
    @State private var viewModel = IGViewModel()

    var body: some View {

        // TEMA: Tabs — Requisito 1
        TabView {

            // Inicio CAMBIA historias (vista) y publicaciones (Me gusta,
            // guardada), así que las recibe con $
            IGInicioView(historias: $viewModel.historias,
                         publicaciones: $viewModel.publicaciones)
                .tabItem {
                    Label("Inicio", systemImage: "house.fill")
                }

            // Buscar solo LEE las fotos
            IGBuscarView(fotos: viewModel.fotosExplorar)
                .tabItem {
                    Label("Buscar", systemImage: "magnifyingglass")
                }

            // Perfil CAMBIA "siguiendo" y "seguidores" → con $
            IGPerfilView(perfil: $viewModel.perfil)
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle")
                }
        }
    }
}

#Preview {
    IGContentView()
}
