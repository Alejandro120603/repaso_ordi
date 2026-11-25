//
//  DisenoContentView.swift
//  Repaso ordi — Práctica 6: diseño SwiftUI
//

import SwiftUI

// Menú de ejemplos: cada pantalla muestra distintas formas de diseñar.
struct DisenoContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Acomodo de elementos") {
                    NavigationLink("1. VStack: vertical") { DisenoVStackView() }
                    NavigationLink("2. HStack: horizontal") { DisenoHStackView() }
                    NavigationLink("3. ZStack: capas") { DisenoZStackView() }
                    NavigationLink("4. Espacios y tamaños") { DisenoEspaciosView() }
                }
                Section("Diseños para reutilizar") {
                    NavigationLink("5. Imágenes y texto") { DisenoImagenesView() }
                    NavigationLink("6. Tarjetas y pantallas") { DisenoTarjetasView() }
                }
            }
            .navigationTitle("Diseño SwiftUI")
        }
    }
}

#Preview {
    DisenoContentView()
}
