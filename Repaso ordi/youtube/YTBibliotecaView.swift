//
//  YTBibliotecaView.swift
//  Repaso ordi — Práctica 5: videos (carpeta youtube)
//

import SwiftUI

struct YTBibliotecaView: View {
    // Solo lee y llama funciones del mismo ViewModel.
    let viewModel: YTViewModel

    var body: some View {
        let videos = viewModel.videosGuardados()

        NavigationStack {
            VStack {
                if videos.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "bookmark")
                            .font(.largeTitle)
                        Text("Aún no tienes videos guardados.")
                    }
                    .foregroundStyle(.gray)
                } else {
                    List(videos) { video in
                        HStack(spacing: 12) {
                            Image(video.imagen)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 95, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 6))

                            VStack(alignment: .leading, spacing: 4) {
                                Text(video.titulo)
                                    .font(.headline)
                                Text(video.canal + " · " + video.duracion)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Videos guardados")
        }
    }
}

#Preview {
    YTBibliotecaView(viewModel: YTViewModel())
}
