//
//  YTBuscarView.swift
//  Repaso ordi — Práctica 5: videos (carpeta youtube)
//

import SwiftUI

struct YTBuscarView: View {
    @Binding var videos: [YTVideo]
    @State private var textoBusqueda = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                        TextField("Buscar videos", text: $textoBusqueda)
                    }
                    .padding(12)
                    .background(Color.gray.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                    // El if filtra lo que se muestra sin copiar el arreglo.
                    ForEach($videos) { $video in
                        if textoBusqueda.isEmpty ||
                            video.titulo.localizedCaseInsensitiveContains(textoBusqueda) ||
                            video.canal.localizedCaseInsensitiveContains(textoBusqueda) {
                            NavigationLink {
                                YTDetalleView(video: $video)
                            } label: {
                                YTVideoView(video: video)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Buscar")
        }
    }
}

#Preview {
    YTBuscarView(videos: .constant(YTViewModel().videos))
}
