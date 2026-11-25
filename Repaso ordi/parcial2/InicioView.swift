//
//  InicioView.swift
//  Repaso ordi — Segundo parcial (Baticave)
//
//  ======================  V I E W  (la "V" de MVVM)  ======================
//
//  Pantalla de INICIO.
//  - Título "Baticave" arriba.                         (Requisito 1)
//  - Lista horizontal con scroll de los 5 cómics.      (Requisito 2)
//  - Imágenes del mismo tamaño y sin deformarse.       (Requisito 3)
//  - Al tocar un cómic, navega a su detalle.           (Requisito 4)
//
//  Esta vista CREA el ViewModel (una sola vez para toda la app)
//  y se lo pasa a las siguientes pantallas.
//

import SwiftUI

struct InicioView: View {

    // @StateObject: CREA el ViewModel y lo mantiene vivo mientras
    // la app esté abierta (no se vuelve a crear al redibujar).
    // Se usa @StateObject SOLO en la vista que lo crea.
    // Las demás pantallas lo reciben con @ObservedObject.
    @StateObject private var viewModel = BaticaveViewModel()

    var body: some View {

        // Requisito 4: NavigationStack es el "contenedor" que permite
        // saltar a otra pantalla (DetalleView) y regresar con "< Atrás".
        // Va UNA sola vez, en la pantalla de inicio.
        NavigationStack {

            // VStack: título arriba y la fila de cómics debajo
            VStack(alignment: .leading, spacing: 20) {

                // Requisito 1: título en la parte superior
                Text("Baticave")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)

                // Requisito 2: lista HORIZONTAL deslizable.
                // ScrollView(.horizontal) = se desliza de izquierda a derecha.
                ScrollView(.horizontal) {

                    // HStack: pone los cómics uno al lado del otro
                    HStack(spacing: 16) {

                        // ForEach: repite este bloque una vez por cada cómic.
                        // viewModel.comics.indices = las posiciones 0, 1, 2, 3, 4.
                        // id: \.self = cada número de posición sirve como id.
                        // Usamos la POSICIÓN (indice) para que el detalle sepa
                        // qué cómic del ViewModel leer y modificar.
                        ForEach(viewModel.comics.indices, id: \.self) { indice in

                            // Requisito 4 y 7: NavigationLink = "al tocarme, ve a...".
                            // Le pasamos a DetalleView el ViewModel y la posición
                            // del cómic tocado: así cada cómic abre SU información.
                            NavigationLink {
                                // destino: la pantalla que se abre
                                DetalleView(viewModel: viewModel, indice: indice)
                            } label: {
                                // label: lo que se ve y se puede tocar
                                VStack(spacing: 8) {

                                    // Requisito 2: imagen del cómic
                                    Image(viewModel.comics[indice].imagen)
                                        .resizable()       // permite cambiarle el tamaño
                                        // Requisito 3: scaledToFit mantiene las
                                        // proporciones (no estira ni aplasta la imagen)
                                        .scaledToFit()
                                        // Requisito 3: TODAS con el mismo tamaño
                                        .frame(width: 150, height: 230)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))

                                    // Requisito 2: nombre del cómic debajo
                                    Text(viewModel.comics[indice].nombre)
                                        .font(.headline)
                                }
                            }
                            // .plain: quita el estilo de botón azul que el
                            // NavigationLink pone por defecto (sobre todo en Mac)
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)
                }

                // Spacer: empuja todo hacia arriba
                Spacer()
            }
            .padding(.top)
        }
    }
}

#Preview {
    InicioView()
}
