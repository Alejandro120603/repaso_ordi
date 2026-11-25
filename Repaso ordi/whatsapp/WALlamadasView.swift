//
//  WALlamadasView.swift
//  Repaso ordi — Práctica 4: mensajería (carpeta whatsapp)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pestaña Llamadas).
//  Requisito 7: lista sencilla con nombre, hora y un ícono de llamada
//  entrante o saliente.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct WALlamadasView: View {

    // TEMA: parámetros — las llamadas (solo lectura)
    let llamadas: [WALlamada]

    var body: some View {
        NavigationStack {
            List(llamadas) { llamada in
                HStack(spacing: 12) {

                    WAAvatarView(iniciales: llamada.iniciales, color: llamada.color, tamano: 44)

                    VStack(alignment: .leading, spacing: 2) {
                        Text(llamada.nombre)
                            .font(.headline)

                        HStack(spacing: 4) {
                            // Flecha hacia abajo-izquierda = entrante (me llamaron)
                            // Flecha hacia arriba-derecha = saliente (yo llamé)
                            Image(systemName: llamada.entrante ? "arrow.down.left" : "arrow.up.right")
                                .foregroundStyle(llamada.entrante ? Color.blue : Color.green)
                            Text(llamada.hora)
                                .foregroundStyle(.gray)
                        }
                        .font(.caption)
                    }

                    Spacer()

                    Image(systemName: "phone.fill")
                        .foregroundStyle(.green)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Llamadas")
        }
    }
}

#Preview {
    WALlamadasView(llamadas: WAViewModel().llamadas)
}
