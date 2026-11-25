//
//  DisenoHStackView.swift
//  Repaso ordi — Práctica 6: diseño SwiftUI
//

import SwiftUI

struct DisenoHStackView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("1. Imagen antes o después").font(.headline)
                HStack(spacing: 12) {
                    Image(systemName: "person.circle.fill").font(.largeTitle)
                    Text("Imagen a la izquierda")
                }
                HStack(spacing: 12) {
                    Text("Imagen a la derecha")
                    Image(systemName: "person.circle.fill").font(.largeTitle)
                }

                Text("2. Extremos de una fila").font(.headline)
                HStack {
                    Text("Configuración").bold()
                    Spacer() // empuja la flecha hacia la derecha
                    Image(systemName: "chevron.right")
                }
                .padding()
                .background(Color.gray.opacity(0.12))

                Text("3. Alineación superior").font(.headline)
                HStack(alignment: .top, spacing: 12) {
                    Image("batman")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 65, height: 65)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Batman").bold()
                        Text("Mensaje de ejemplo").foregroundStyle(.gray)
                        Text("Hace 5 minutos").font(.caption)
                    }
                    Spacer()
                }

                Text("4. Alineación inferior").font(.headline)
                HStack(alignment: .bottom, spacing: 12) {
                    Rectangle().fill(.blue).frame(width: 40, height: 40)
                    Rectangle().fill(.green).frame(width: 40, height: 80)
                    Rectangle().fill(.orange).frame(width: 40, height: 110)
                }

                Text("5. Dos columnas iguales").font(.headline)
                HStack(spacing: 12) {
                    Text("Columna 1")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .background(Color.blue.opacity(0.15))
                    Text("Columna 2")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .background(Color.green.opacity(0.15))
                }
            }
            .padding()
        }
        .navigationTitle("HStack")
    }
}

#Preview {
    DisenoHStackView()
}
