//
//  IGPerfilView.swift
//  Repaso ordi — Práctica 2: fotos e historias (carpeta instagram)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pestaña Perfil).
//  Requisito 6: foto circular, 3 contadores, botón Seguir/Siguiendo
//  (con @Binding) y cuadrícula de 3 columnas.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct IGPerfilView: View {

    // TEMA: @Binding
    // DUEÑO: IGViewModel (lo creó IGContentView).
    // Esta pantalla lo recibe prestado para pasarle al botón Seguir
    // $perfil.siguiendo y $perfil.seguidores.
    @Binding var perfil: IGPerfil

    var body: some View {

        // TEMA: Navigation (aquí solo para mostrar el título arriba)
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {

                    // ---------- Foto + 3 contadores ----------
                    HStack {
                        IGAvatarView(iniciales: perfil.iniciales, color: perfil.color, tamano: 86)

                        Spacer()

                        // La misma vista 3 veces con distintos parámetros
                        IGContadorView(numero: perfil.fotos.count, titulo: "publicaciones")
                        IGContadorView(numero: perfil.seguidores, titulo: "seguidores")
                        IGContadorView(numero: perfil.seguidos, titulo: "seguidos")
                    }

                    // ---------- Nombre y biografía ----------
                    Text(perfil.nombre)
                        .bold()
                    Text(perfil.biografia)

                    // ---------- Botón Seguir (componente con @Binding) ----------
                    IGBotonSeguir(siguiendo: $perfil.siguiendo,
                                  seguidores: $perfil.seguidores)
                }
                .padding()

                // ---------- Cuadrícula de 3 columnas ----------
                IGCuadriculaView(fotos: perfil.fotos)
            }
            .navigationTitle(perfil.usuario)
        }
    }
}

// MARK: - IGContadorView (número grande + texto pequeño)

struct IGContadorView: View {

    // TEMA: parámetros
    let numero: Int
    let titulo: String

    var body: some View {
        VStack {
            Text("\(numero)")
                .font(.headline)
            Text(titulo)
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    IGPerfilView(perfil: .constant(IGViewModel().perfil))
}
