//
//  FBContentView.swift
//  Repaso ordi — Práctica 1: red social con feed (carpeta facebook)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pantalla principal con las pestañas).
//  - CREA el ViewModel (es su dueño).
//  - Arma las 3 pestañas: Inicio, Amigos y Perfil.
//  - A cada pestaña le pasa solo lo que necesita del ViewModel.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct FBContentView: View {

    // TEMA: MVVM + @State
    // Aquí se crea el ViewModel UNA sola vez. @State lo mantiene vivo y
    // además nos da el signo $ para "prestar" sus datos con @Binding:
    //     $viewModel.publicaciones
    @State private var viewModel = FBViewModel()

    var body: some View {

        // TEMA: Tabs
        // Requisito 1: TabView con 3 pestañas. Cada vista de adentro es una pestaña.
        TabView {

            // Pestaña Inicio: necesita CAMBIAR los Me gusta, así que recibe
            // las publicaciones con $ (Binding). Al usuario actual solo lo lee.
            FBInicioView(publicaciones: $viewModel.publicaciones, yo: viewModel.yo)
                .tabItem {
                    Label("Inicio", systemImage: "house.fill")
                }

            // Pestaña Amigos: solo LEE la lista, no necesita $
            FBAmigosView(amigos: viewModel.amigos)
                .tabItem {
                    Label("Amigos", systemImage: "person.2.fill")
                }

            // Pestaña Perfil: mi propio perfil.
            // NavigationStack para que se vea el título arriba.
            NavigationStack {
                FBPerfilView(usuario: viewModel.yo)
            }
            .tabItem {
                Label("Perfil", systemImage: "person.crop.circle.fill")
            }
        }
    }
}

#Preview {
    FBContentView()
}
