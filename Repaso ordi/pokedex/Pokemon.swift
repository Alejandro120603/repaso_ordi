//
//  Pokemon.swift
//  Repaso ordi — Pokédex
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: MODEL.
//  Aquí solo se define la FORMA de los datos. No descarga nada, no dibuja
//  nada y no tiene lógica. Hay dos grupos de structs:
//
//   1) Structs Codable ("idioma de la API"): copian la forma del JSON que
//      manda la PokéAPI, con los nombres EXACTOS del JSON (en inglés).
//      JSONDecoder los llena automáticamente.
//
//   2) struct Pokemon ("idioma de la app"): lo que usan las pantallas, con
//      nombres en español y los datos ya listos para mostrar. El ViewModel
//      convierte (1) en (2).
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

// MARK: - 1) Structs Codable: forma del JSON de la LISTA

// TEMA: API — Codable
// Codable = "este struct se puede convertir desde/hacia JSON".
// Regla de oro: el nombre de cada propiedad debe ser IGUAL a la clave del
// JSON. Las claves que NO declaramos (count, next, previous, url...) se
// ignoran: solo escribimos lo que vamos a usar.

// JSON de https://pokeapi.co/api/v2/pokemon?limit=20
// {
//   "count": 1350,                 ← no lo usamos, no se declara
//   "next": "https://...",         ← no lo usamos
//   "previous": null,              ← no lo usamos
//   "results": [ ... ]             ← results
// }
struct RespuestaLista: Codable {
    let results: [ResultadoLista]   // "results" es un arreglo [ ... ]
}

// Cada elemento de "results":
// { "name": "bulbasaur", "url": "https://pokeapi.co/api/v2/pokemon/1/" }
//    ↑ name                ↑ no lo usamos (armamos la dirección con el nombre)
struct ResultadoLista: Codable {
    let name: String
}

// MARK: - 1) Structs Codable: forma del JSON del DETALLE

// JSON de https://pokeapi.co/api/v2/pokemon/bulbasaur (solo lo que usamos)
// {
//   "id": 1,                       ← número
//   "name": "bulbasaur",           ← nombre
//   "height": 7,                   ← altura en DECÍMETROS (7 = 0.7 m)
//   "weight": 69,                  ← peso en HECTOGRAMOS (69 = 6.9 kg)
//   "types": [ ... ],              ← tipos
//   "stats": [ ... ],              ← estadísticas
//   "sprites": { ... }             ← imágenes
// }
struct PokemonAPI: Codable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [TipoAPI]
    let stats: [EstadisticaAPI]
    let sprites: SpritesAPI
}

// Cada elemento de "types":
// { "slot": 1, "type": { "name": "grass", "url": "..." } }
//               ↑ type (otro objeto { } → otro struct: NombreAPI)
struct TipoAPI: Codable {
    let type: NombreAPI
}

// Cada elemento de "stats":
// { "base_stat": 45, "effort": 0, "stat": { "name": "hp", "url": "..." } }
//    ↑ base_stat (el valor)          ↑ stat (de qué estadística es)
// Se escribe "base_stat" con guion bajo porque así viene en el JSON.
struct EstadisticaAPI: Codable {
    let base_stat: Int
    let stat: NombreAPI
}

// Objeto que se repite dentro de "type" y de "stat":
// { "name": "grass", "url": "..." }   o   { "name": "hp", "url": "..." }
//    ↑ name
struct NombreAPI: Codable {
    let name: String
}

// "sprites": {
//   "front_default": "...1.png",   ← imagen chiquita (96 px), no la usamos
//   "other": { ... }               ← other
// }
struct SpritesAPI: Codable {
    let other: OtrasImagenesAPI
}

// "other": {
//   "home": { ... },               ← home: imagen grande y nítida
//   "official-artwork": { ... },   ← no la usamos (el guion "-" no se puede
//   ...                               escribir en un nombre de propiedad)
// }
struct OtrasImagenesAPI: Codable {
    let home: ImagenHomeAPI
}

// "home": { "front_default": "https://raw.githubusercontent.com/.../home/1.png", ... }
//            ↑ front_default
// String? (opcional) porque en algunos Pokémon puede venir null.
struct ImagenHomeAPI: Codable {
    let front_default: String?
}

// MARK: - 2) Model de la app: Pokemon

// Lo que usan las pantallas. Ya viene "limpio": nombre con mayúscula,
// número con ceros, altura en metros, etc. (lo prepara el ViewModel).
//
// Identifiable: List y ForEach necesitan saber qué "id" tiene cada fila.
struct Pokemon: Identifiable {
    let numero: Int          // 1
    let numeroTexto: String  // "001"
    let nombre: String       // "Bulbasaur"
    let tipos: [String]      // ["Grass", "Poison"]
    let imagen: String       // dirección (URL) de la imagen, como texto
    let altura: Double       // en metros (0.7)
    let peso: Double         // en kilos (6.9)
    let vida: Int            // estadística "hp"
    let ataque: Int          // estadística "attack"
    let defensa: Int         // estadística "defense"

    // "var" porque el usuario lo cambia con el corazón.
    // "= false": todos empiezan sin ser favoritos.
    var esFavorito: Bool = false

    // id calculado: el número del Pokémon ya es único
    var id: Int { numero }
}

// Pokémon de ejemplo SOLO para los #Preview (en la app real se usan los
// que llegan de la API).
let pokemonDeEjemplo = Pokemon(
    numero: 1,
    numeroTexto: "001",
    nombre: "Bulbasaur",
    tipos: ["Grass", "Poison"],
    imagen: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png",
    altura: 0.7,
    peso: 6.9,
    vida: 45,
    ataque: 49,
    defensa: 49
)
