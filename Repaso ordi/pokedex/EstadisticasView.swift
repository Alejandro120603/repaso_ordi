//
//  EstadisticasView.swift
//  Repaso ordi — Pokédex
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pestaña "Estadísticas").
//  Muestra vida, ataque y defensa, cada una con su nombre, una barra y
//  el número. Hay dos vistas:
//   - EstadisticasView: la pestaña completa.
//   - BarraEstadisticaView: UNA fila (nombre + barra + número), reutilizable.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

// MARK: - EstadisticasView (la pestaña)

struct EstadisticasView: View {

    // TEMA: parámetros — el Pokémon seleccionado
    let pokemon: Pokemon

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            // La misma vista 3 veces, con distintos parámetros
            BarraEstadisticaView(nombre: "Vida", valor: pokemon.vida, color: .green)
            BarraEstadisticaView(nombre: "Ataque", valor: pokemon.ataque, color: .red)
            BarraEstadisticaView(nombre: "Defensa", valor: pokemon.defensa, color: .blue)

            // Spacer: empuja las barras hacia arriba
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - BarraEstadisticaView (una fila)

struct BarraEstadisticaView: View {

    // TEMA: parámetros — qué mostrar en esta fila
    let nombre: String    // "Vida"
    let valor: Int        // 45
    let color: Color      // .green

    // Ancho de la barra cuando está "llena"
    let anchoMaximo = 200.0

    // Propiedad calculada: el ancho depende del valor.
    // Tomamos 150 como "barra llena" (las estadísticas de estos 20
    // Pokémon están por debajo). Regla de tres: valor / 150 * 200.
    var anchoBarra: Double {
        let ancho = Double(valor) / 150 * anchoMaximo
        // por si algún valor pasa de 150, que no se salga del fondo
        if ancho > anchoMaximo {
            return anchoMaximo
        }
        return ancho
    }

    var body: some View {
        HStack(spacing: 12) {

            // Nombre, con ancho fijo para que las 3 barras empiecen alineadas
            Text(nombre)
                .frame(width: 70, alignment: .leading)

            // ZStack(alignment: .leading): las dos barras una encima de la
            // otra, pegadas a la izquierda
            ZStack(alignment: .leading) {

                // Fondo gris: la barra "vacía" (siempre del ancho máximo)
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: anchoMaximo, height: 14)

                // Barra de color: su ancho DEPENDE del valor
                RoundedRectangle(cornerRadius: 6)
                    .fill(color)
                    .frame(width: anchoBarra, height: 14)
            }

            // El número
            Text("\(valor)")
                .bold()
        }
    }
}

#Preview {
    EstadisticasView(pokemon: pokemonDeEjemplo)
}
