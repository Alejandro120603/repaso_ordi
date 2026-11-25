//
//  YTContentView.swift
//  Repaso ordi — Práctica 5: videos (carpeta youtube)
//

import SwiftUI

// ROL EN MVVM: VIEW. Crea el ViewModel una sola vez.
struct YTContentView: View {
    @State private var viewModel = YTViewModel()

    var body: some View {
        // TEMA: TabView. Las tres pestañas comparten los mismos datos.
        TabView {
            YTInicioView(videos: $viewModel.videos)
                .tabItem {
                    Label("Inicio", systemImage: "house.fill")
                }

            YTBuscarView(videos: $viewModel.videos)
                .tabItem {
                    Label("Buscar", systemImage: "magnifyingglass")
                }

            YTBibliotecaView(viewModel: viewModel)
                .tabItem {
                    Label("Biblioteca", systemImage: "books.vertical.fill")
                }
        }
        .tint(.red)
    }
}

#Preview {
    YTContentView()
}
