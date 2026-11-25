//
//  YTDetalleView.swift
//  Repaso ordi — Práctica 5: videos (carpeta youtube)
//

import SwiftUI

struct YTDetalleView: View {
    // El video viene prestado desde Inicio o Buscar.
    @Binding var video: YTVideo

    // TEMA: @State. Solo pertenece a esta pantalla.
    @State private var reproduciendo = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Reproductor simulado, como en la práctica Spotify.
                ZStack {
                    YTMiniaturaView(imagen: video.imagen, duracion: video.duracion)
                    YTBotonPlay(reproduciendo: $reproduciendo)
                }

                // Barra de progreso decorativa con ZStack.
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 3)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 260, height: 5)
                    RoundedRectangle(cornerRadius: 3)
                        .fill(Color.red)
                        .frame(width: 90, height: 5)
                }

                Text(video.titulo)
                    .font(.title2)
                    .bold()

                Text(video.vistas)
                    .foregroundStyle(.gray)

                HStack {
                    Image(video.imagen)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                    Text(video.canal)
                        .font(.headline)
                    Spacer()
                }

                HStack {
                    YTBotonMeGusta(meGusta: $video.meGusta)
                    YTBotonGuardar(guardado: $video.guardado)
                }
                Text("Reproducción simulada para practicar SwiftUI.")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .padding()
        }
        .navigationTitle("Video")
    }
}

#Preview {
    NavigationStack {
        YTDetalleView(video: .constant(YTViewModel().videos[0]))
    }
}
