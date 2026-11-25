//
//  WANovedadesView.swift
//  Repaso ordi — Práctica 4: mensajería (carpeta whatsapp)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pestaña Novedades).
//  Requisito 7: fila horizontal de estados en círculos.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct WANovedadesView: View {

    // TEMA: parámetros — los estados (solo lectura)
    let estados: [WAEstado]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {

                    Text("Estados")
                        .font(.title2)
                        .bold()

                    // Scroll horizontal de círculos
                    ScrollView(.horizontal) {
                        HStack(spacing: 16) {

                            // "Mi estado": círculo gris con un "+"
                            VStack(spacing: 6) {
                                Circle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 64, height: 64)
                                    .overlay(
                                        Image(systemName: "plus")
                                            .font(.title2)
                                            .bold()
                                    )
                                Text("Mi estado")
                                    .font(.caption)
                            }

                            // Un círculo por cada estado
                            ForEach(estados) { estado in
                                VStack(spacing: 6) {
                                    WAAvatarView(iniciales: estado.iniciales,
                                                 color: estado.color, tamano: 64)
                                        // TEMA: .overlay — anillo verde alrededor
                                        .overlay(
                                            Circle()
                                                .stroke(Color.green, lineWidth: 3)
                                                .padding(-4)
                                        )
                                        .padding(4)
                                    Text(estado.nombre)
                                        .font(.caption)
                                    Text(estado.hora)
                                        .font(.caption2)
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding()
            }
            .navigationTitle("Novedades")
        }
    }
}

#Preview {
    WANovedadesView(estados: WAViewModel().estados)
}
