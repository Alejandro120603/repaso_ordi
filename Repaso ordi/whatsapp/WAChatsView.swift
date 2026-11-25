//
//  WAChatsView.swift
//  Repaso ordi — Práctica 4: mensajería (carpeta whatsapp)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pestaña Chats).
//  Requisito 2: lista de chats (foto, nombre, último mensaje, hora y
//  círculo de no leídos).
//  Requisito 3: tocar un chat abre la conversación.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct WAChatsView: View {

    // TEMA: MVVM
    // El ViewModel llega como parámetro normal. Lo pasamos tal cual a la
    // conversación para que ella pueda llamar a enviar() y marcarComoLeido().
    let viewModel: WAViewModel

    var body: some View {

        // TEMA: Navigation
        NavigationStack {
            List {
                // Por posiciones: la conversación necesita saber QUÉ chat es
                ForEach(viewModel.chats.indices, id: \.self) { indice in

                    // Requisito 3: abre la conversación de ESTE chat
                    NavigationLink {
                        WAConversacionView(viewModel: viewModel, indice: indice)
                    } label: {
                        WAFilaChatView(chat: viewModel.chats[indice])
                    }
                }
            }
            .navigationTitle("Chats")
        }
    }
}

// MARK: - WAFilaChatView (una fila de la lista)

// Solo MUESTRA un chat.
struct WAFilaChatView: View {

    // TEMA: parámetros
    let chat: WAChat

    var body: some View {
        HStack(spacing: 12) {

            // Foto circular
            WAAvatarView(iniciales: chat.iniciales, color: chat.color, tamano: 52)

            VStack(alignment: .leading, spacing: 4) {

                // Línea 1: nombre ... hora
                HStack {
                    Text(chat.nombre)
                        .font(.headline)
                    Spacer()
                    Text(chat.horaUltimo)
                        .font(.caption)
                        // verde si hay mensajes sin leer
                        .foregroundStyle(chat.noLeidos > 0 ? Color.green : Color.gray)
                }

                // Línea 2: último mensaje ... círculo de no leídos
                HStack {
                    Text(chat.ultimoMensaje)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        // Requisito 2: una sola línea (si no cabe, termina en "...")
                        .lineLimit(1)

                    Spacer()

                    // Requisito 2: el círculo solo aparece si hay no leídos
                    if chat.noLeidos > 0 {
                        Text("\(chat.noLeidos)")
                            .font(.caption)
                            .bold()
                            .foregroundStyle(.white)
                            .frame(width: 22, height: 22)
                            .background(Circle().fill(Color.green))
                    }
                }
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    WAChatsView(viewModel: WAViewModel())
}
