//
//  FBAmigosView.swift
//  Repaso ordi — Práctica 1: red social con feed (carpeta facebook)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pestaña Amigos).
//  Requisito 6: lista de usuarios; tocar uno abre su perfil.
//  Solo LEE los datos, por eso recibe la lista con "let" (sin @Binding).
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct FBAmigosView: View {

    // TEMA: parámetros — la lista de amigos (solo lectura)
    let amigos: [FBUsuario]

    var body: some View {

        // TEMA: Navigation
        NavigationStack {

            // List: lista vertical con scroll incluido.
            // Crea una fila por cada amigo; "amigo" es el de esa fila.
            List(amigos) { amigo in

                // Requisito 6: tocar la fila abre el MISMO FBPerfilView
                // que se usa desde el feed, con este amigo como parámetro.
                NavigationLink {
                    FBPerfilView(usuario: amigo)
                } label: {
                    HStack(spacing: 12) {
                        FBAvatarView(usuario: amigo, tamano: 50)

                        VStack(alignment: .leading, spacing: 2) {
                            Text(amigo.nombre)
                                .font(.headline)
                            Text(amigo.ciudad)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Amigos")
        }
    }
}

#Preview {
    FBAmigosView(amigos: FBViewModel().amigos)
}
