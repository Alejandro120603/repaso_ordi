//
//  SPBuscarView.swift
//  Repaso ordi — Práctica 3: música (carpeta spotify)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pestaña Buscar).
//  Una caja de búsqueda (decorativa) y tarjetas de categorías en 2
//  columnas hechas con VStack y HStack.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct SPBuscarView: View {

    // TEMA: parámetros — categorías (solo lectura)
    let categorias: [SPCategoria]

    // TEMA: @State — el texto de búsqueda es de ESTA pantalla
    @State private var textoBusqueda = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    // Caja de búsqueda
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                        TextField("¿Qué quieres escuchar?", text: $textoBusqueda)
                    }
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.gray.opacity(0.15))
                    )

                    Text("Explorar todo")
                        .font(.title2)
                        .bold()

                    // 2 columnas: cada fila tiene la categoría fila*2 y fila*2+1
                    ForEach(0..<(categorias.count / 2), id: \.self) { fila in
                        HStack(spacing: 12) {
                            SPTarjetaCategoriaView(categoria: categorias[fila * 2])
                            SPTarjetaCategoriaView(categoria: categorias[fila * 2 + 1])
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Buscar")
        }
    }
}

// MARK: - SPTarjetaCategoriaView (una tarjeta de color)

struct SPTarjetaCategoriaView: View {

    let categoria: SPCategoria

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(categoria.color)
            .frame(height: 90)
            // nombre arriba a la izquierda, ícono abajo a la derecha
            .overlay(
                VStack {
                    HStack {
                        Text(categoria.nombre)
                            .font(.headline)
                            .bold()
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Image(systemName: categoria.icono)
                            .font(.title)
                    }
                }
                .foregroundStyle(.white)
                .padding(10)
            )
    }
}

#Preview {
    SPBuscarView(categorias: SPViewModel().categorias)
}
