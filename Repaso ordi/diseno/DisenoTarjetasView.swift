//
//  DisenoTarjetasView.swift
//  Repaso ordi — Práctica 6: diseño SwiftUI
//

import SwiftUI

// Componente reutilizable: recibe parámetros, como las otras prácticas.
struct DisenoTarjeta: View {
    let imagen: String
    let titulo: String
    let descripcion: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(imagen)
                .resizable()
                .scaledToFill()
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 8))
            Text(titulo).font(.headline)
            Text(descripcion).font(.caption).foregroundStyle(.gray)
        }
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.12))
        )
    }
}

struct DisenoTarjetasView: View {
    let imagenes = ["batman", "spiderman", "flash", "superman"]
    @State private var favorito = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("1. Encabezado con acción").font(.headline)
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Hola").font(.largeTitle).bold()
                        Text("Explora tus favoritos").foregroundStyle(.gray)
                    }
                    Spacer()
                    Button {
                        favorito.toggle()
                    } label: {
                        Image(systemName: favorito ? "heart.fill" : "heart")
                            .font(.title)
                            .foregroundStyle(.red)
                    }
                    .buttonStyle(.plain)
                }

                Text("2. Tarjetas en dos columnas").font(.headline)
                // Igual que el patrón de filas de Spotify.
                ForEach(0..<(imagenes.count / 2), id: \.self) { fila in
                    HStack(alignment: .top, spacing: 12) {
                        DisenoTarjeta(imagen: imagenes[fila * 2],
                                      titulo: imagenes[fila * 2].capitalized,
                                      descripcion: "Personaje")
                        DisenoTarjeta(imagen: imagenes[fila * 2 + 1],
                                      titulo: imagenes[fila * 2 + 1].capitalized,
                                      descripcion: "Personaje")
                    }
                }

                Text("3. Scroll horizontal").font(.headline)
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(imagenes, id: \.self) { imagen in
                            DisenoTarjeta(imagen: imagen,
                                          titulo: imagen.capitalized,
                                          descripcion: "Personaje")
                                .frame(width: 140)
                        }
                    }
                }

                Text("4. Botón de ancho completo").font(.headline)
                Button {
                    favorito.toggle()
                } label: {
                    Text(favorito ? "Quitar de favoritos" : "Agregar a favoritos")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding(14)
                        .foregroundStyle(.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .buttonStyle(.plain)
            }
            .padding()
        }
        .navigationTitle("Tarjetas")
    }
}

#Preview {
    DisenoTarjetasView()
}
