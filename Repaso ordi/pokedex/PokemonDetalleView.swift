//
//  PokemonDetalleView.swift
//  Repaso ordi — Pokédex
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pantalla 2: detalle).
//  - Recibe el Pokémon seleccionado como parámetro (no muestra uno fijo).
//  - Recibe un @Binding a su favorito, que vive en el ViewModel.
//  - Muestra la franja con la imagen, el nombre, el número, el tipo,
//    el corazón y las dos pestañas.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct PokemonDetalleView: View {

    // TEMA: parámetros
    // Requisito 4: el Pokémon que se tocó en la lista.
    // Sin valor aquí: hay que dárselo al crear la vista.
    let pokemon: Pokemon

    // TEMA: @Binding
    // El favorito NO vive en esta pantalla: vive en el ViewModel.
    // La lista nos lo "presta" con $ y, si lo cambiamos aquí,
    // al regresar la lista ya lo ve cambiado (Requisito 10).
    @Binding var esFavorito: Bool

    var body: some View {

        // spacing: 0 = la franja queda pegada a lo de abajo
        VStack(spacing: 0) {

            // Requisito 5: franja de color con la imagen grande centrada
            AsyncImage(url: URL(string: pokemon.imagen)) { imagen in
                imagen
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Text("Cargando...")
                    .foregroundStyle(.white)
            }
            .frame(width: 200, height: 200)
            // maxWidth: .infinity = la franja usa todo el ancho
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            // .background: el color va DETRÁS de la imagen
            .background(Color.red.opacity(0.85))

            // Requisitos 6 y 7: datos a la izquierda, corazón a la derecha
            HStack(alignment: .top) {

                VStack(alignment: .leading, spacing: 6) {

                    // Requisito 6: nombre
                    Text(pokemon.nombre)
                        .font(.largeTitle)
                        .bold()

                    // Requisito 6: número con ceros ("Número 001")
                    Text("Número \(pokemon.numeroTexto)")
                        .font(.headline)
                        .foregroundStyle(.gray)

                    // Requisito 6: etiqueta(s) del tipo en un rectángulo redondeado.
                    // ForEach: una etiqueta por cada tipo (algunos tienen 2).
                    // id: \.self = el propio texto sirve como id.
                    HStack {
                        ForEach(pokemon.tipos, id: \.self) { tipo in
                            Text(tipo)
                                .font(.caption)
                                .bold()
                                .foregroundStyle(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 4)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.blue)
                                )
                        }
                    }
                }

                // Spacer: empuja el corazón a la derecha
                Spacer()

                // Requisitos 7 y 9: el MISMO corazón que en la lista.
                // Le pasamos $esFavorito: el Binding que recibimos, lo
                // volvemos a "prestar" al corazón (Binding de Binding).
                CorazonFavoritoView(esFavorito: $esFavorito, tamano: 34)
            }
            .padding()

            // TEMA: Tabs
            // Requisito 8: dos pestañas. Cada vista de adentro es una pestaña.
            TabView {

                InformacionView(pokemon: pokemon)
                    .tabItem {
                        Label("Información", systemImage: "info.circle.fill")
                    }

                EstadisticasView(pokemon: pokemon)
                    .tabItem {
                        Label("Estadísticas", systemImage: "chart.bar.fill")
                    }
            }
        }
        // Título en la barra de navegación: el nombre del Pokémon
        .navigationTitle(pokemon.nombre)
    }
}

#Preview {
    // .constant(true): un Binding "de mentiras" que siempre vale true.
    // Solo sirve para el Preview, porque aquí no hay ViewModel.
    NavigationStack {
        PokemonDetalleView(pokemon: pokemonDeEjemplo, esFavorito: .constant(true))
    }
}
