//
//  PokedexView.swift
//  Repaso ordi — Pokédex
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pantalla 1: lista).
//  - Crea el ViewModel y le pide que cargue los Pokémon (.task).
//  - Muestra "Cargando...", un mensaje de error o la lista, según lo que
//    diga el ViewModel.
//  - Cada fila navega al detalle (NavigationStack + NavigationLink).
//  - Le pasa al corazón y al detalle un @Binding al favorito que vive en
//    el ViewModel.
//  Esta vista no sabe nada de URLs ni de JSON.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct PokedexView: View {

    // TEMA: MVVM + @State
    // Aquí se CREA el ViewModel (una sola vez). @State lo mantiene vivo
    // aunque la vista se vuelva a dibujar.
    // Además, @State nos da el signo $ para sacar @Binding de sus datos:
    //     $viewModel.pokemons[indice].esFavorito
    @State private var viewModel = PokedexViewModel()

    var body: some View {

        // TEMA: Navigation
        // Requisito 3: NavigationStack permite ir al detalle y regresar con "< Atrás".
        NavigationStack {

            VStack {

                // Tres casos, según lo que diga el ViewModel:
                if viewModel.cargando {

                    // Mientras descarga
                    Text("Cargando...")
                        .font(.title2)

                } else if viewModel.mensajeError != "" {

                    // Si la API falló: mensaje sencillo en vez de lista vacía
                    VStack(spacing: 12) {
                        Image(systemName: "wifi.exclamationmark")
                            .font(.largeTitle)
                        Text(viewModel.mensajeError)
                    }
                    .foregroundStyle(.red)
                    .padding()

                } else {

                    // Requisito 2: lista desplazable con los 20 Pokémon.
                    // List ya trae scroll incluido.
                    List {

                        // TEMA: ForEach
                        // Recorremos las POSICIONES (0, 1, 2, ... 19).
                        // Usamos la posición para poder escribir
                        // $viewModel.pokemons[indice].esFavorito (un @Binding).
                        ForEach(viewModel.pokemons.indices, id: \.self) { indice in

                            // Fila: [ enlace al detalle ] [ corazón ]
                            HStack {

                                // TEMA: Navigation
                                // Requisito 3 y 4: al tocar, abre el detalle de
                                // ESTE Pokémon (se lo pasamos como parámetro).
                                NavigationLink {
                                    // Destino: el detalle recibe
                                    //  - el Pokémon de esta fila
                                    //  - un @Binding a SU favorito en el ViewModel
                                    PokemonDetalleView(
                                        pokemon: viewModel.pokemons[indice],
                                        esFavorito: $viewModel.pokemons[indice].esFavorito
                                    )
                                } label: {
                                    // Lo que se ve en la fila
                                    FilaPokemonView(pokemon: viewModel.pokemons[indice])
                                }

                                // Requisitos 2 y 9: corazón a la derecha.
                                // @Binding: el corazón cambia un dato que vive en el ViewModel.
                                CorazonFavoritoView(
                                    esFavorito: $viewModel.pokemons[indice].esFavorito,
                                    tamano: 22
                                )
                            }
                        }
                    }
                }
            }
            // Requisito 1: título en la barra de navegación
            .navigationTitle("Pokédex")
            // TEMA: API — .task
            // .task corre código async cuando la vista aparece.
            // La vista solo PIDE la carga; quien llama a la API es el ViewModel.
            .task {
                await viewModel.cargarPokemons()
            }
        }
    }
}

// MARK: - FilaPokemonView (lo que se ve en cada fila)

// Vista pequeña que solo MUESTRA un Pokémon: imagen en círculo, nombre y tipo.
// TEMA: parámetros — recibe el Pokémon con "let pokemon".
struct FilaPokemonView: View {

    let pokemon: Pokemon

    var body: some View {
        HStack(spacing: 12) {

            // Requisito 2: imagen dentro de un círculo.
            // ZStack: el círculo atrás y la imagen encima.
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.15))
                    .frame(width: 60, height: 60)
                    // .overlay: dibuja una orilla encima del círculo
                    .overlay(
                        Circle().stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )

                // TEMA: API — AsyncImage
                // Descarga y muestra una imagen desde internet.
                // URL(string:) convierte el texto en dirección.
                AsyncImage(url: URL(string: pokemon.imagen)) { imagen in
                    // Cuando ya llegó la imagen:
                    imagen
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    // Mientras llega:
                    Text("...")
                }
                .frame(width: 48, height: 48)
            }

            // Nombre y, debajo, el tipo (más pequeño y gris)
            VStack(alignment: .leading, spacing: 2) {
                Text(pokemon.nombre)          // ya viene con mayúscula del ViewModel
                    .font(.headline)

                // joined: une ["Grass", "Poison"] en "Grass, Poison"
                Text(pokemon.tipos.joined(separator: ", "))
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    // Este Preview sí descarga los datos reales de la API
    PokedexView()
}
