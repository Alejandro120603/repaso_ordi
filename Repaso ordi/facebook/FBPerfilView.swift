//
//  FBPerfilView.swift
//  Repaso ordi — Práctica 1: red social con feed (carpeta facebook)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (perfil de un usuario).
//  Requisito 5: recibe al usuario seleccionado como parámetro, así que
//  sirve para CUALQUIER usuario. Se usa en 3 lugares:
//   - al tocar el autor de una publicación (Inicio)
//   - al tocar un amigo (Amigos)
//   - en la pestaña Perfil (con mi usuario)
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct FBPerfilView: View {

    // TEMA: parámetros
    // Sin valor aquí: quien abre esta pantalla debe decir qué usuario mostrar.
    let usuario: FBUsuario

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {

                // Portada: rectángulo del color del usuario
                RoundedRectangle(cornerRadius: 12)
                    .fill(usuario.color.opacity(0.35))
                    .frame(height: 140)

                // Foto de perfil grande
                FBAvatarView(usuario: usuario, tamano: 110)

                Text(usuario.nombre)
                    .font(.title)
                    .bold()

                Text(usuario.biografia)
                    .foregroundStyle(.gray)

                // TEMA: Label (ícono + texto)
                VStack(alignment: .leading, spacing: 8) {
                    Label("Vive en \(usuario.ciudad)", systemImage: "house.fill")
                    Label("\(usuario.amigos) amigos", systemImage: "person.2.fill")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.08))
                )
            }
            .padding()
        }
        // Título de la barra: el nombre del usuario recibido
        .navigationTitle(usuario.nombre)
    }
}

#Preview {
    NavigationStack {
        FBPerfilView(usuario: FBViewModel().yo)
    }
}
