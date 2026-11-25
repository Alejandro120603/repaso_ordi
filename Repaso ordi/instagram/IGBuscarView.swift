//
//  IGBuscarView.swift
//  Repaso ordi — Práctica 2: fotos e historias (carpeta instagram)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pestaña Buscar).
//  Una caja de búsqueda (decorativa) y una cuadrícula de fotos para explorar.
//  Reutiliza IGCuadriculaView, la misma del Perfil.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct IGBuscarView: View {

    // TEMA: parámetros — fotos para explorar (solo lectura)
    let fotos: [Color]

    // TEMA: @State — el texto de búsqueda vive en ESTA pantalla (es su dueña)
    @State private var textoBusqueda = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 12) {

                    // Caja de búsqueda: ícono + TextField sobre un fondo redondeado
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                        // TextField: escribe directamente en el @State con $
                        TextField("Buscar", text: $textoBusqueda)
                    }
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.15))
                    )
                    .padding(.horizontal)

                    IGCuadriculaView(fotos: fotos)
                }
            }
            .navigationTitle("Buscar")
        }
    }
}

#Preview {
    IGBuscarView(fotos: IGViewModel().fotosExplorar)
}
