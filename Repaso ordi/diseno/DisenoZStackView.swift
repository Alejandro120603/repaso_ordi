//
//  DisenoZStackView.swift
//  Repaso ordi — Práctica 6: diseño SwiftUI
//

import SwiftUI

struct DisenoZStackView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("1. Fondo y texto encima").font(.headline)
                // El primer hijo queda atrás; el último queda adelante.
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.blue)
                        .frame(height: 110)
                    Text("Texto encima del fondo")
                        .foregroundStyle(.white)
                        .bold()
                }

                Text("2. Imagen con título abajo").font(.headline)
                ZStack(alignment: .bottomLeading) {
                    Image("spiderman")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 180)
                        .frame(maxWidth: .infinity)
                        .clipped()
                    Text("Spider-Man")
                        .bold()
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(Color.black.opacity(0.7))
                        .padding(8)
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))

                Text("3. Notificación arriba a la derecha").font(.headline)
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "bell.fill")
                        .font(.largeTitle)
                        .frame(width: 65, height: 65)
                    Circle()
                        .fill(.red)
                        .frame(width: 23, height: 23)
                        .overlay {
                            Text("3").font(.caption).foregroundStyle(.white)
                        }
                }

                Text("4. Botón encima de una miniatura").font(.headline)
                ZStack {
                    Image("sonic")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 150)
                        .frame(maxWidth: .infinity)
                        .clipped()
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 55))
                        .foregroundStyle(.white)
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .navigationTitle("ZStack")
    }
}

#Preview {
    DisenoZStackView()
}
