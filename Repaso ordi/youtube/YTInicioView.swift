//
//  YTInicioView.swift
//  Repaso ordi — Práctica 5: videos (carpeta youtube)
//

import SwiftUI

struct YTInicioView: View {
    // TEMA: @Binding. El dueño del arreglo es YTViewModel.
    @Binding var videos: [YTVideo]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Image(systemName: "play.rectangle.fill")
                            .foregroundStyle(.red)
                        Text("YouTube")
                            .bold()
                    }
                    .font(.largeTitle)

                    Text("Recomendados")
                        .font(.title2)
                        .bold()

                    // Cada detalle recibe el Binding del video original.
                    ForEach($videos) { $video in
                        NavigationLink {
                            YTDetalleView(video: $video)
                        } label: {
                            YTVideoView(video: video)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("Inicio")
        }
    }
}

#Preview {
    YTInicioView(videos: .constant(YTViewModel().videos))
}
