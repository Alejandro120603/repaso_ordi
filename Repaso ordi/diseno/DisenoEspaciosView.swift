//
//  DisenoEspaciosView.swift
//  Repaso ordi — Práctica 6: diseño SwiftUI
//

import SwiftUI

struct DisenoEspaciosView: View {
    // Cambia estos valores y observa el resultado.
    let separacion: CGFloat = 20
    let ancho: CGFloat = 120
    let alto: CGFloat = 45

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("1. spacing: distancia entre hijos").font(.headline)
                HStack(spacing: separacion) {
                    Circle().fill(.blue).frame(width: 40, height: 40)
                    Circle().fill(.green).frame(width: 40, height: 40)
                    Circle().fill(.orange).frame(width: 40, height: 40)
                }
                Text("Separación: 20 puntos").font(.caption)

                Text("2. Spacer fijo y flexible").font(.headline)
                HStack {
                    Text("A")
                    Spacer().frame(width: 40) // exactamente 40 puntos
                    Text("B")
                    Spacer() // ocupa lo que sobra
                    Text("C")
                }
                .padding()
                .background(Color.gray.opacity(0.12))

                Text("3. frame: ancho y alto").font(.headline)
                Text("120 × 45")
                    .frame(width: ancho, height: alto)
                    .background(Color.blue.opacity(0.2))

                Text("4. padding: espacio alrededor").font(.headline)
                Text("20 en todos los lados")
                    .padding(20)
                    .background(Color.green.opacity(0.2))
                Text("24 horizontal, 8 vertical")
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(Color.orange.opacity(0.2))
                Text("Solo izquierda y arriba")
                    .padding(.leading, 30)
                    .padding(.top, 15)
                    .background(Color.purple.opacity(0.2))

                Text("5. El orden de los modificadores importa").font(.headline)
                // El fondo azul incluye el padding.
                Text("padding → fondo")
                    .padding(15)
                    .background(Color.blue.opacity(0.2))
                // El fondo verde solo cubre el texto; padding queda fuera.
                Text("fondo → padding")
                    .background(Color.green.opacity(0.2))
                    .padding(15)

                Text("6. Ancho completo y alineación").font(.headline)
                Text("Izquierda")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.blue.opacity(0.15))
                Text("Centro")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.green.opacity(0.15))
                Text("Derecha")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .background(Color.orange.opacity(0.15))
            }
            .padding()
        }
        .navigationTitle("Espacios")
    }
}

#Preview {
    DisenoEspaciosView()
}
