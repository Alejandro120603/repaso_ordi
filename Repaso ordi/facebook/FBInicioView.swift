//
//  FBInicioView.swift
//  Repaso ordi — Práctica 1: red social con feed (carpeta facebook)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pestaña Inicio).
//  - Arriba: caja "¿Qué estás pensando?" con mi foto de perfil.
//  - Debajo: feed desplazable de publicaciones.
//  Recibe las publicaciones "prestadas" (@Binding) para que cada botón de
//  Me gusta pueda cambiar SU contador en el ViewModel.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct FBInicioView: View {

    // TEMA: @Binding
    // DUEÑO del dato: FBViewModel (lo creó FBContentView).
    // Esta pantalla NO es dueña: lo recibe prestado para pasarle a cada
    // publicación SU parte con $publicaciones[indice].
    @Binding var publicaciones: [FBPublicacion]

    // TEMA: parámetros — mi usuario, solo para leerlo (foto de la caja)
    let yo: FBUsuario

    var body: some View {

        // TEMA: Navigation
        // NavigationStack: permite ir al perfil del autor y regresar.
        NavigationStack {

            // Requisito 2: feed desplazable (scroll vertical)
            ScrollView {

                VStack(spacing: 12) {

                    // ---------- Caja "¿Qué estás pensando?" ----------
                    HStack(spacing: 12) {
                        // Foto de perfil circular (componente reutilizable)
                        FBAvatarView(usuario: yo, tamano: 44)

                        Text("¿Qué estás pensando?")
                            .foregroundStyle(.gray)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            // ocupa todo el ancho que sobra, texto a la izquierda
                            .frame(maxWidth: .infinity, alignment: .leading)
                            // .overlay: dibuja la orilla redondeada ENCIMA del texto
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                            )
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray.opacity(0.08))
                    )

                    // ---------- Feed de publicaciones ----------
                    // TEMA: ForEach
                    // Recorremos las POSICIONES (0, 1, 2...) para poder escribir
                    // $publicaciones[indice] (un Binding a ESA publicación).
                    ForEach(publicaciones.indices, id: \.self) { indice in
                        FBPublicacionView(publicacion: $publicaciones[indice])
                    }
                }
                .padding()
            }
            .navigationTitle("Inicio")
        }
    }
}

#Preview {
    // .constant(...): Binding "de prueba" solo para el Preview
    FBInicioView(publicaciones: .constant(FBViewModel().publicaciones),
                 yo: FBViewModel().yo)
}
