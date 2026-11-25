//
//  YTMiniaturaView.swift
//  Repaso ordi — Práctica 5: videos (carpeta youtube)
//

import SwiftUI

// Componente reutilizable: imagen local y duración sobre la imagen.
struct YTMiniaturaView: View {
    let imagen: String
    let duracion: String

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(imagen)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .clipped()

            Text(duracion)
                .font(.caption)
                .bold()
                .padding(5)
                .background(Color.black)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .padding(8)
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    YTMiniaturaView(imagen: "batman", duracion: "12:30")
        .padding()
}
