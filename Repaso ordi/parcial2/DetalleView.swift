//
//  DetalleView.swift
//  Repaso ordi — Segundo parcial (Baticave)
//
//  ======================  V I E W  (la "V" de MVVM)  ======================
//
//  Pantalla de DETALLE de un cómic.
//  - Recibe el cómic que se tocó en InicioView.        (Requisito 7)
//  - Imagen del cómic arriba, a todo lo ancho.         (Requisito 5)
//  - 2 pestañas: Sinopsis y Capítulos.                 (Requisito 6)
//

import SwiftUI

struct DetalleView: View {

    // @ObservedObject: RECIBE el ViewModel que creó InicioView
    // (no crea uno nuevo) y se redibuja cuando sus datos cambian.
    @ObservedObject var viewModel: BaticaveViewModel

    // Requisito 7: la posición del cómic seleccionado (0 = Spiderman, 1 = SuperMan...).
    // No tiene valor aquí: hay que dárselo al crear la vista:
    //     DetalleView(viewModel: viewModel, indice: indice)
    // Así no muestra siempre el mismo cómic, sino el que se tocó.
    let indice: Int

    var body: some View {

        // spacing: 0 = la imagen y las pestañas quedan pegadas
        VStack(spacing: 0) {

            // Requisito 5: imagen del cómic seleccionado en la parte superior
            Image(viewModel.comics[indice].imagen)
                .resizable()
                // scaledToFill: llena el espacio SIN deformarse
                // (lo que sobra se recorta con .clipped() de abajo)
                .scaledToFill()
                // Requisito 5: maxWidth: .infinity = usa todo el ancho posible.
                // height: 250 = altura fija para que quede espacio a las pestañas.
                // alignment: .top = si se recorta, se ve la parte de ARRIBA
                // de la portada (donde suele ir el título del cómic).
                .frame(maxWidth: .infinity)
                .frame(height: 250, alignment: .top)
                .clipped()   // recorta lo que se sale del marco

            // Requisito 6: TabView = pantalla con pestañas.
            // Cada vista que va adentro es una pestaña.
            TabView {

                // Pestaña 1: Sinopsis (le pasamos el mismo ViewModel y cómic)
                SinopsisView(viewModel: viewModel, indice: indice)
                    // .tabItem: el texto e ícono de la pestaña
                    .tabItem {
                        Label("Sinopsis", systemImage: "info.circle.fill")
                    }

                // Pestaña 2: Capítulos (le pasamos el mismo ViewModel y cómic)
                CapitulosView(viewModel: viewModel, indice: indice)
                    .tabItem {
                        Label("Capítulos", systemImage: "book.fill")
                    }
            }
        }
        // Título de la barra de navegación: el nombre del cómic seleccionado
        .navigationTitle(viewModel.comics[indice].nombre)
    }
}

#Preview {
    // En el preview metemos un NavigationStack para ver la barra de arriba.
    // Creamos un ViewModel de prueba; indice 0 = Spiderman.
    NavigationStack {
        DetalleView(viewModel: BaticaveViewModel(), indice: 0)
    }
}
