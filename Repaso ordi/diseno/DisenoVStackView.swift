//
//  DisenoVStackView.swift
//  Repaso ordi — Práctica 6: diseño SwiftUI
//

import SwiftUI

struct DisenoVStackView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("1. Vertical centrado").font(.headline)
                // Por defecto, VStack centra horizontalmente sus hijos.
                // spacing: separación ENTRE los hijos, en puntos.
                VStack(spacing: 8) {
                    Image(systemName: "person.circle.fill").font(.largeTitle)
                    Text("Daniel").bold()
                    Text("Estudiante").foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue.opacity(0.1))

                Text("2. Alineado a la izquierda").font(.headline)
                // alignment: .leading, .center o .trailing.
                VStack(alignment: .leading, spacing: 12) {
                    Text("Título").font(.title2).bold()
                    Text("Subtítulo").font(.subheadline)
                    Text("Descripción de un producto o publicación.")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.green.opacity(0.1))

                Text("3. Alineado a la derecha").font(.headline)
                VStack(alignment: .trailing, spacing: 4) {
                    Text("Mensaje enviado")
                    Text("12:30").font(.caption).foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)

                Text("4. Separar arriba y abajo").font(.headline)
                VStack {
                    Text("Encabezado")
                    Spacer() // toma el espacio vertical disponible
                    Text("Pie de pantalla")
                }
                .frame(maxWidth: .infinity)
                .frame(height: 150) // sin altura disponible, Spacer puede ser pequeño
                .padding()
                .background(Color.orange.opacity(0.1))
            }
            .padding()
        }
        .navigationTitle("VStack")
    }
}

#Preview {
    DisenoVStackView()
}
