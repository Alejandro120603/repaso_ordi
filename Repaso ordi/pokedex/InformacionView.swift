//
//  InformacionView.swift
//  Repaso ordi — Pokédex
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pestaña "Información").
//  Solo muestra la altura, el peso y los tipos del Pokémon que recibe.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct InformacionView: View {

    // TEMA: parámetros — el Pokémon seleccionado, lo manda PokemonDetalleView
    let pokemon: Pokemon

    var body: some View {

        // alignment: .leading = todo alineado a la izquierda
        VStack(alignment: .leading, spacing: 16) {

            // TEMA: Label (ícono + texto juntos)
            // String(...) convierte el número Double (0.7) en texto ("0.7")
            Label("Altura: " + String(pokemon.altura) + " m", systemImage: "ruler")

            Label("Peso: " + String(pokemon.peso) + " kg", systemImage: "scalemass")

            // joined: une ["Grass", "Poison"] en "Grass, Poison"
            Label("Tipos: " + pokemon.tipos.joined(separator: ", "), systemImage: "tag")

            // Spacer: empuja todo hacia arriba
            Spacer()
        }
        .font(.title3)
        .padding()
        // ocupa todo el ancho y se pega a la izquierda
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    InformacionView(pokemon: pokemonDeEjemplo)
}
