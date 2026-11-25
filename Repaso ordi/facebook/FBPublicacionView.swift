//
//  FBPublicacionView.swift
//  Repaso ordi — Práctica 1: red social con feed (carpeta facebook)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (tarjeta de UNA publicación).
//  Requisito 3: foto circular, nombre, hora, texto, imagen y la fila de
//  botones Me gusta / Comentar / Compartir.
//  Requisito 5: tocar la foto o el nombre abre el perfil del autor.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct FBPublicacionView: View {

    // TEMA: @Binding
    // DUEÑO: FBViewModel. Esta tarjeta solo la recibe prestada, para poder
    // pasarle al botón de Me gusta $publicacion.leDiMeGusta y $publicacion.meGustas.
    @Binding var publicacion: FBPublicacion

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            // ---------- Encabezado: foto + nombre + hora ----------
            // TEMA: Navigation
            // Requisito 5: NavigationLink = "al tocarme, ve al perfil".
            // El perfil recibe al AUTOR de esta publicación como parámetro.
            NavigationLink {
                FBPerfilView(usuario: publicacion.autor)
            } label: {
                HStack(spacing: 10) {
                    FBAvatarView(usuario: publicacion.autor, tamano: 44)

                    VStack(alignment: .leading, spacing: 2) {
                        Text(publicacion.autor.nombre)
                            .font(.headline)
                        Text(publicacion.hora)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
            }
            // .plain: que el enlace no se pinte azul como botón
            .buttonStyle(.plain)

            // ---------- Texto ----------
            Text(publicacion.texto)

            // ---------- Imagen (rectángulo de color con un ícono) ----------
            RoundedRectangle(cornerRadius: 10)
                .fill(publicacion.colorImagen.opacity(0.8))
                .frame(height: 200)
                .overlay(
                    Image(systemName: publicacion.icono)
                        .font(.system(size: 60))
                        .foregroundStyle(.white)
                )

            // ---------- Contadores ----------
            HStack {
                // El número cambia solo cuando el botón cambia meGustas
                Label("\(publicacion.meGustas)", systemImage: "hand.thumbsup.circle.fill")
                    .foregroundStyle(.blue)
                Spacer()
                Text("\(publicacion.comentarios) comentarios")
                    .foregroundStyle(.gray)
            }
            .font(.caption)

            // ---------- Fila de 3 botones ----------
            HStack {
                // Requisito 4: Me gusta, vista aparte con @Binding.
                // Le prestamos DOS datos de esta publicación con $.
                FBBotonMeGusta(leDiMeGusta: $publicacion.leDiMeGusta,
                               meGustas: $publicacion.meGustas)

                Spacer()

                // Comentar y Compartir: botones decorativos (no hacen nada)
                Button {
                    // sin acción: solo practicamos la interfaz
                } label: {
                    Label("Comentar", systemImage: "bubble.left")
                }
                .buttonStyle(.plain)
                .foregroundStyle(.gray)

                Spacer()

                Button {
                    // sin acción
                } label: {
                    Label("Compartir", systemImage: "arrowshape.turn.up.right")
                }
                .buttonStyle(.plain)
                .foregroundStyle(.gray)
            }
            .font(.subheadline)
        }
        .padding()
        // fondo de la tarjeta
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.08))
        )
    }
}

#Preview {
    NavigationStack {
        FBPublicacionView(publicacion: .constant(FBViewModel().publicaciones[0]))
            .padding()
    }
}
