//
//  CorazonFavoritoView.swift
//  Repaso ordi — Pokédex
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (componente reutilizable).
//  El corazón de favorito. Se usa en DOS lugares:
//   - En cada fila de la lista (PokedexView).
//   - En el detalle (PokemonDetalleView).
//  No guarda el favorito: lo recibe "prestado" con @Binding. El dato real
//  vive en el ViewModel (pokemons[indice].esFavorito).
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct CorazonFavoritoView: View {

    // TEMA: @Binding
    // Requisito 9: el corazón cambia un dato que vive en el ViewModel.
    //  - @State   = el dato vive en ESTA vista.
    //  - @Binding = el dato vive en OTRO lado; aquí solo lo leemos y cambiamos.
    // Quien use esta vista le pasa el dato con $:
    //     CorazonFavoritoView(esFavorito: $viewModel.pokemons[indice].esFavorito)
    @Binding var esFavorito: Bool

    // TEMA: parámetros (var con valor por defecto)
    // Tamaño del ícono. Si no se manda, vale 24.
    // En la lista mandamos 22 y en el detalle 34.
    var tamano: Double = 24

    var body: some View {
        Button {
            // TEMA: withAnimation
            // Requisito 7: el cambio de vacío ↔ lleno se anima
            // (cambia el ícono, el tamaño y el círculo de fondo suavemente).
            withAnimation {
                // toggle(): true ↔ false.
                // Como es @Binding, el cambio llega hasta el ViewModel.
                esFavorito.toggle()
            }
        } label: {
            // "heart.fill" (relleno) si es favorito, "heart" (vacío) si no
            // condición ? siEsVerdad : siEsFalso
            Image(systemName: esFavorito ? "heart.fill" : "heart")
                // un poco más grande cuando está marcado (se anima)
                .font(.system(size: esFavorito ? tamano * 1.2 : tamano))
                .foregroundStyle(.red)
                .padding(8)
                // círculo rosita detrás cuando está marcado
                .background(
                    Circle()
                        .fill(esFavorito ? Color.red.opacity(0.15) : Color.clear)
                )
        }
        // .borderless: el botón no tiene fondo, y dentro de una List solo
        // reacciona el corazón (no toda la fila). Así, tocar el corazón
        // marca el favorito y tocar el resto de la fila abre el detalle.
        .buttonStyle(.borderless)
    }
}

#Preview {
    // .constant(...): Binding "de mentiras" solo para el Preview
    HStack(spacing: 30) {
        CorazonFavoritoView(esFavorito: .constant(false))
        CorazonFavoritoView(esFavorito: .constant(true), tamano: 34)
    }
}
