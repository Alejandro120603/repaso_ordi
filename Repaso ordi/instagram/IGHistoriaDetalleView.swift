//
//  IGHistoriaDetalleView.swift
//  Repaso ordi — Práctica 2: fotos e historias (carpeta instagram)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (detalle de una historia).
//  Requisito 3: muestra la historia tocada y la marca como vista.
//  Al regresar, el borde de su círculo ya se ve gris.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct IGHistoriaDetalleView: View {

    // TEMA: parámetros — la historia que se tocó (para mostrarla)
    let historia: IGHistoria

    // TEMA: @Binding
    // DUEÑO: IGViewModel (historias[indice].vista).
    // Esta pantalla solo lo MODIFICA: lo pone en true al abrirse.
    @Binding var vista: Bool

    var body: some View {
        VStack(spacing: 20) {

            // Encabezado: foto + usuario
            HStack {
                IGAvatarView(iniciales: historia.iniciales, color: historia.color, tamano: 40)
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                Text(historia.usuario)
                    .bold()
                    .foregroundStyle(.white)
                Spacer()
            }

            Spacer()

            // "Contenido" de la historia: un ícono grande y un texto
            Image(systemName: historia.icono)
                .font(.system(size: 120))
                .foregroundStyle(.white)

            Text(historia.texto)
                .font(.title2)
                .bold()
                .foregroundStyle(.white)

            Spacer()
        }
        .padding()
        // ocupa toda la pantalla
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        // fondo del color de la historia
        .background(historia.color)
        .navigationTitle("Historia")
        // .onAppear: se ejecuta cuando esta pantalla aparece.
        // Requisito 3: aquí la marcamos como vista. Como "vista" es un
        // @Binding, el cambio se guarda en el ViewModel.
        .onAppear {
            vista = true
        }
    }
}

#Preview {
    NavigationStack {
        IGHistoriaDetalleView(historia: IGViewModel().historias[0], vista: .constant(false))
    }
}
