//
//  IGPublicacionView.swift
//  Repaso ordi — Práctica 2: fotos e historias (carpeta instagram)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (tarjeta de UNA publicación del feed).
//  Requisito 4: encabezado (foto + usuario), imagen cuadrada de ancho
//  completo, fila de íconos, número de Me gusta y descripción.
//  Requisito 5: el corazón y guardar son vistas aparte con @Binding.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct IGPublicacionView: View {

    // TEMA: @Binding
    // DUEÑO: IGViewModel. La tarjeta la recibe prestada para pasarle al
    // corazón y a guardar SUS datos con $publicacion.xxx
    @Binding var publicacion: IGPublicacion

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            // ---------- Encabezado ----------
            HStack {
                IGAvatarView(iniciales: publicacion.iniciales,
                             color: publicacion.colorAvatar, tamano: 34)
                Text(publicacion.usuario)
                    .bold()
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)

            // ---------- Imagen cuadrada de ancho completo ----------
            // Rectangle: rectángulo sin esquinas redondeadas.
            // .aspectRatio(1, ...): alto = ancho → cuadrado, ocupe el ancho que ocupe.
            Rectangle()
                .fill(publicacion.colorImagen.opacity(0.8))
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    Image(systemName: publicacion.icono)
                        .font(.system(size: 90))
                        .foregroundStyle(.white)
                )

            // ---------- Fila de íconos ----------
            HStack(spacing: 16) {
                // Requisito 5: corazón con @Binding (2 datos prestados)
                IGBotonCorazon(leDiMeGusta: $publicacion.leDiMeGusta,
                               meGustas: $publicacion.meGustas)

                // comentario y enviar: solo íconos decorativos
                Image(systemName: "bubble.right")
                Image(systemName: "paperplane")

                Spacer()

                // Requisito 5: guardar con @Binding
                IGBotonGuardar(guardada: $publicacion.guardada)
            }
            .font(.title2)
            .padding(.horizontal)

            // ---------- Me gusta y descripción ----------
            Text("\(publicacion.meGustas) Me gusta")
                .bold()
                .padding(.horizontal)

            HStack(alignment: .top) {
                Text(publicacion.usuario)
                    .bold()
                Text(publicacion.descripcion)
            }
            .padding(.horizontal)
        }
        .padding(.bottom, 12)
    }
}

#Preview {
    ScrollView {
        IGPublicacionView(publicacion: .constant(IGViewModel().publicaciones[0]))
    }
}
