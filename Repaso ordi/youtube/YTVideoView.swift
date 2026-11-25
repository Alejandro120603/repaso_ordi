//
//  YTVideoView.swift
//  Repaso ordi — Práctica 5: videos (carpeta youtube)
//

import SwiftUI

// Tarjeta reutilizable del feed. Solo lee el video.
struct YTVideoView: View {
    let video: YTVideo

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            YTMiniaturaView(imagen: video.imagen, duracion: video.duracion)

            HStack(alignment: .top, spacing: 12) {
                Image(video.imagen)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 42, height: 42)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 4) {
                    Text(video.titulo)
                        .font(.headline)
                    Text(video.canal + " · " + video.vistas)
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                Spacer()
            }
        }
    }
}
