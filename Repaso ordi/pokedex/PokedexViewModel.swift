//
//  PokedexViewModel.swift
//  Repaso ordi — Pokédex
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEWMODEL.
//  Es el "cerebro" de la Pokédex:
//   - Llama a la PokéAPI (URLSession + async/await).
//   - Convierte el JSON en structs (JSONDecoder + Codable).
//   - Guarda los datos que ven las pantallas: la lista de Pokémon,
//     si está cargando, el mensaje de error y los FAVORITOS.
//  Las vistas NUNCA llaman a la API: solo le piden al ViewModel que cargue
//  y muestran lo que él tiene.
//
//  Mismo estilo que el profesor (repaso/Api/Pokedex/PokemonListViewModel):
//  una clase con @Observable y @MainActor.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

// TEMA: MVVM
// @MainActor: todo lo de esta clase corre en el hilo principal. Es necesario
// porque sus datos se muestran en pantalla y la pantalla solo se puede
// actualizar desde el hilo principal (sobre todo después de un "await").
//
// @Observable: las vistas "observan" esta clase. Cuando cambia una de sus
// propiedades (pokemons, cargando, mensajeError), las vistas que la leen se
// vuelven a dibujar solas.
//
// ¿Por qué class y no struct? Porque la lista y el detalle deben usar los
// MISMOS datos (por ejemplo, el mismo favorito). Una clase se comparte;
// un struct se copiaría.
@MainActor
@Observable
class PokedexViewModel {

    // MARK: - Datos que observan las vistas

    // Los 20 Pokémon ya convertidos al Model de la app.
    // Requisito 10: aquí adentro vive "esFavorito" de cada uno, así que
    // la lista y el detalle leen y cambian el MISMO dato.
    var pokemons: [Pokemon] = []

    // true mientras se descarga → la vista muestra "Cargando...".
    // Empieza en true porque al abrir la app lo primero es cargar.
    var cargando = true

    // "" = no hay error. Si la API falla, aquí se guarda el mensaje.
    var mensajeError = ""

    // MARK: - Llamada a la API

    // TEMA: API — async/await
    // async: la función puede "esperar" a internet sin congelar la app.
    // Quien la llama debe usar "await" (lo hace .task en PokedexView).
    func cargarPokemons() async {

        // Si ya se cargaron, no se vuelve a descargar.
        // (Si se descargaran otra vez, se perderían los favoritos marcados.)
        if pokemons.count > 0 {
            return
        }

        cargando = true
        mensajeError = ""

        // do / catch: "intenta esto; si algo falla, salta al catch".
        // "try" marca cada línea que puede fallar (sin internet, JSON raro...).
        do {
            // ----------------- LISTA DE 20 POKÉMON -----------------

            // 1. Dirección: convertir el texto en una URL.
            // guard let: si el texto no es una URL válida, sale de la función.
            guard let urlLista = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=20") else {
                mensajeError = "La dirección de la API no es válida."
                cargando = false
                return
            }

            // 2. Descargar: URLSession pide la dirección a internet.
            // "await" = espera aquí hasta que llegue la respuesta.
            // Regresa dos cosas: los datos (JSON en bytes) y la respuesta (no la usamos: _).
            let (datosLista, _) = try await URLSession.shared.data(from: urlLista)

            // 3. Convertir el JSON: JSONDecoder llena el struct RespuestaLista.
            // "RespuestaLista.self" = "convierte el JSON a este tipo".
            let lista = try JSONDecoder().decode(RespuestaLista.self, from: datosLista)

            // ----------------- DETALLE DE CADA POKÉMON -----------------
            // La lista solo trae el nombre. La imagen, tipos, altura, peso y
            // estadísticas vienen en el detalle, así que pedimos uno por uno.

            // Arreglo temporal donde vamos juntando los Pokémon listos
            var nuevosPokemons: [Pokemon] = []

            // for: repite el bloque por cada resultado de la lista
            for resultado in lista.results {

                // 4. Dirección del detalle, armada con el nombre
                guard let urlDetalle = URL(string: "https://pokeapi.co/api/v2/pokemon/\(resultado.name)") else {
                    continue   // si falla, se salta este Pokémon y sigue con el siguiente
                }

                // 5. Descargar el detalle
                let (datosDetalle, _) = try await URLSession.shared.data(from: urlDetalle)

                // 6. Convertir el JSON del detalle al struct PokemonAPI
                let pokemonAPI = try JSONDecoder().decode(PokemonAPI.self, from: datosDetalle)

                // 7. Traducir del "idioma de la API" al Model de la app
                nuevosPokemons.append(convertir(pokemonAPI))
            }

            // 8. Guardar: al cambiar "pokemons", la lista se redibuja sola
            pokemons = nuevosPokemons

        } catch {
            // Si CUALQUIER paso con "try" falló, llegamos aquí.
            // En vez de dejar la lista vacía, guardamos un mensaje para la vista.
            mensajeError = "No se pudo cargar la Pokédex. Revisa tu conexión a internet."
        }

        // Terminó (bien o mal): ya no está cargando
        cargando = false
    }

    // MARK: - Convertir PokemonAPI → Pokemon

    // Recibe los datos tal como vienen de la API y regresa un Pokemon
    // listo para mostrar (nombres en español, mayúsculas, metros, etc.).
    func convertir(_ api: PokemonAPI) -> Pokemon {

        // Número con ceros a la izquierda: 1 → "001", 25 → "025", 150 → "150"
        var numeroTexto = "\(api.id)"
        if api.id < 10 {
            numeroTexto = "00\(api.id)"
        } else if api.id < 100 {
            numeroTexto = "0\(api.id)"
        }

        // Tipos: de [TipoAPI] a ["Grass", "Poison"]
        // .capitalized pone la primera letra en mayúscula
        var tipos: [String] = []
        for tipo in api.types {
            tipos.append(tipo.type.name.capitalized)
        }

        // Estadísticas: buscamos por NOMBRE (no por posición) vida, ataque y defensa
        var vida = 0
        var ataque = 0
        var defensa = 0
        for estadistica in api.stats {
            if estadistica.stat.name == "hp" {
                vida = estadistica.base_stat
            } else if estadistica.stat.name == "attack" {
                ataque = estadistica.base_stat
            } else if estadistica.stat.name == "defense" {
                defensa = estadistica.base_stat
            }
        }

        return Pokemon(
            numero: api.id,
            numeroTexto: numeroTexto,
            nombre: api.name.capitalized,                    // "bulbasaur" → "Bulbasaur"
            tipos: tipos,
            // ?? "": si la imagen viene null (nil), usa "" (texto vacío)
            imagen: api.sprites.other.home.front_default ?? "",
            altura: Double(api.height) / 10,                 // decímetros → metros
            peso: Double(api.weight) / 10,                   // hectogramos → kilos
            vida: vida,
            ataque: ataque,
            defensa: defensa
        )
    }
}
