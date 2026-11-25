//
//  Repaso_ordiApp.swift
//  Repaso ordi
//
//  Created by Daniel on 11/25/26.
//

import SwiftUI

@main
struct Repaso_ordiApp: App {
    var body: some Scene {
        WindowGroup {
            // Vista raíz = la primera pantalla que se ve al abrir la app.
            //
            // CÓMO CAMBIAR DE EJERCICIO:
            // deja SOLO UNA línea sin "//". Comenta (pon "//" al inicio)
            // la que está activa y quita el "//" de la que quieras ver.

            // Práctica 1: red social con feed (carpeta facebook)
            // FBContentView()

            // Práctica 2: fotos e historias (carpeta instagram)
            // IGContentView()

            // Práctica 3: música (carpeta spotify)
            // SPContentView()

            // Práctica 4: mensajería (carpeta whatsapp)
            // WAContentView()

            // Práctica 5: videos (carpeta youtube)
            // YTContentView()

            // Práctica 6: diseño SwiftUI (carpeta diseno)
            // DisenoContentView()

            // Práctica 7: viajes (carpeta didi)
            // DDContentView()

            // Caso A: Compendium (carpeta hyrule) ← ACTIVA
            HyruleInicioView()

            // Pokédex con la PokéAPI (carpeta pokedex)
            // PokedexView()

            // Login (carpeta navigationStack)
            // Login()

            // 2do parcial, Baticave (carpeta parcial2)
            // InicioView()

            // Repaso básico
            // ContentView()
        }
    }
}
