//
//  WABarraMensajeView.swift
//  Repaso ordi — Práctica 4: mensajería (carpeta whatsapp)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (componente con @Binding).
//  Requisito 5: barra con un TextField y un botón de enviar.
//  Al enviar: el mensaje se agrega A TRAVÉS DEL VIEWMODEL y el campo se limpia.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct WABarraMensajeView: View {

    // TEMA: @Binding
    // DUEÑA del texto: WAConversacionView (su @State texto).
    // La barra solo lo MODIFICA: el TextField escribe en él y el botón lo
    // limpia. Como es prestado, la conversación siempre sabe lo que escribí.
    @Binding var texto: String

    // TEMA: MVVM — para pedirle al ViewModel que agregue el mensaje
    let viewModel: WAViewModel
    let indice: Int

    var body: some View {
        HStack(spacing: 8) {

            // TextField: cada letra que escribo se guarda en "texto"
            // (que en realidad vive en la conversación)
            TextField("Mensaje", text: $texto)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.15))
                )

            Button {
                // 1. El ViewModel agrega el mensaje al chat
                viewModel.enviar(texto, indiceChat: indice)
                // 2. Limpiamos el campo (cambia el @State de la conversación)
                texto = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundStyle(.white)
                    .frame(width: 40, height: 40)
                    .background(Circle().fill(Color.green))
            }
            .buttonStyle(.plain)
        }
        .padding(8)
        .background(Color.gray.opacity(0.08))
    }
}

#Preview {
    WABarraMensajeView(texto: .constant("Hola"), viewModel: WAViewModel(), indice: 0)
}
