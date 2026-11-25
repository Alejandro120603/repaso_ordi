//
//  WAConversacionView.swift
//  Repaso ordi — Práctica 4: mensajería (carpeta whatsapp)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (conversación de un chat).
//  Requisito 3: recibe el chat seleccionado y pone sus no leídos en cero.
//  Requisito 4: burbujas (mías a la derecha, del contacto a la izquierda).
//  Requisito 5: abajo, la barra para escribir (WABarraMensajeView).
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct WAConversacionView: View {

    // TEMA: parámetros
    // El ViewModel (para enviar y marcar como leído) y la posición del chat
    // seleccionado. Con los dos, esta pantalla sabe QUÉ chat mostrar.
    let viewModel: WAViewModel
    let indice: Int

    // TEMA: @State
    // Lo que voy escribiendo. DUEÑA: esta pantalla.
    // Se lo presta a la barra con $texto (allá es @Binding).
    @State private var texto = ""

    var body: some View {

        // VStack(spacing: 0): mensajes arriba, barra pegada abajo
        VStack(spacing: 0) {

            // ---------- Mensajes ----------
            ScrollView {
                VStack(spacing: 8) {
                    // ForEach directo sobre los mensajes de ESTE chat
                    ForEach(viewModel.chats[indice].mensajes) { mensaje in
                        WABurbujaView(mensaje: mensaje)
                    }
                }
                .padding()
            }
            // fondo verdoso muy claro, como "papel tapiz"
            .background(Color.green.opacity(0.06))

            // ---------- Barra para escribir ----------
            // Requisito 5: le prestamos el texto con $ (allá es @Binding),
            // y le pasamos el ViewModel y el índice para que pueda enviar.
            WABarraMensajeView(texto: $texto, viewModel: viewModel, indice: indice)
        }
        .navigationTitle(viewModel.chats[indice].nombre)
        // .onAppear: se ejecuta cuando la pantalla aparece.
        // Requisito 3: le pedimos al ViewModel que ponga los no leídos en cero.
        .onAppear {
            viewModel.marcarComoLeido(indiceChat: indice)
        }
    }
}

// MARK: - WABurbujaView (un mensaje)

// Solo MUESTRA un mensaje como burbuja.
struct WABurbujaView: View {

    let mensaje: WAMensaje

    var body: some View {
        HStack {
            // Mío → un Spacer a la IZQUIERDA empuja la burbuja a la derecha
            if mensaje.esMio {
                Spacer(minLength: 60)
            }

            VStack(alignment: .trailing, spacing: 4) {
                Text(mensaje.texto)
                Text(mensaje.hora)
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            .padding(10)
            // Requisito 4: burbuja con RoundedRectangle.
            // Verde si es mío, gris si es del contacto.
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(mensaje.esMio ? Color.green.opacity(0.3) : Color.gray.opacity(0.2))
            )

            // Del contacto → un Spacer a la DERECHA empuja la burbuja a la izquierda
            if mensaje.esMio == false {
                Spacer(minLength: 60)
            }
        }
    }
}

#Preview {
    NavigationStack {
        WAConversacionView(viewModel: WAViewModel(), indice: 1)
    }
}
