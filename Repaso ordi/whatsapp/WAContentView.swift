//
//  WAContentView.swift
//  Repaso ordi — Práctica 4: mensajería (carpeta whatsapp)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pantalla principal con las pestañas).
//  - CREA el ViewModel (es su dueño).
//  - Arma las 3 pestañas: Chats, Novedades y Llamadas.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct WAContentView: View {

    // TEMA: MVVM + @State — el ViewModel se crea aquí una sola vez
    @State private var viewModel = WAViewModel()

    var body: some View {

        // TEMA: Tabs — Requisito 1
        TabView {

            // Chats recibe el ViewModel completo (sin $): solo lee datos y
            // llama funciones (enviar, marcarComoLeido).
            WAChatsView(viewModel: viewModel)
                .tabItem {
                    Label("Chats", systemImage: "message.fill")
                }

            // Novedades y Llamadas solo leen sus listas
            WANovedadesView(estados: viewModel.estados)
                .tabItem {
                    Label("Novedades", systemImage: "circle.dashed")
                }

            WALlamadasView(llamadas: viewModel.llamadas)
                .tabItem {
                    Label("Llamadas", systemImage: "phone.fill")
                }
        }
    }
}

#Preview {
    WAContentView()
}
