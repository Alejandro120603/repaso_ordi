//
//  DisenoImagenesView.swift
//  Repaso ordi — Práctica 6: diseño SwiftUI
//

import SwiftUI

struct DisenoImagenesView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("1. SF Symbols").font(.headline)
                HStack(spacing: 20) {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 32))
                        .foregroundStyle(.red)
                    Label("Favoritos", systemImage: "star.fill")
                        .foregroundStyle(.orange)
                }

                Text("2. scaledToFit: imagen completa").font(.headline)
                Image("flash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 150)
                    .background(Color.gray.opacity(0.15))

                Text("3. scaledToFill: llena y recorta").font(.headline)
                Image("flash")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 220, height: 150)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                Text("4. Avatar circular y texto").font(.headline)
                HStack(spacing: 12) {
                    Image("superman")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Superman").font(.headline)
                        Text("En línea").font(.caption).foregroundStyle(.green)
                    }
                    Spacer()
                }

                Text("5. Imagen arriba, texto abajo").font(.headline)
                VStack(alignment: .leading, spacing: 8) {
                    Image("batman")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 150)
                        .frame(maxWidth: .infinity)
                        .clipped()
                    Text("Batman").font(.title2).bold()
                    Text("Descripción de la imagen").foregroundStyle(.gray)
                }
            }
            .padding()
        }
        .navigationTitle("Imágenes")
    }
}

#Preview {
    DisenoImagenesView()
}
