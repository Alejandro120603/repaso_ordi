//
//  SinopsisView.swift
//  Repaso ordi — Segundo parcial (Baticave)
//
//  ======================  V I E W  (la "V" de MVVM)  ======================
//
//  Pestaña SINOPSIS y REACCIONES.
//  - Sinopsis del cómic seleccionado.                  (Requisito 8)
//  - Texto "¿Qué te pareció el comic?".                (Requisito 9)
//  - 7 reacciones con imagen, en una fila con scroll.  (Requisitos 10 y 11)
//  - Borde redondeado; otro color si está elegida.     (Requisitos 12 y 13)
//  - Solo una elegida; si la vuelves a tocar, se quita.(Requisitos 14 y 15)
//
//  Esta vista NO decide qué reacción queda elegida:
//  solo le avisa al ViewModel ("tocaron Like") y él aplica las reglas 14 y 15.
//
//  En este archivo hay 2 vistas:
//    - SinopsisView: la pestaña completa.
//    - ReaccionView: componente hijo que dibuja UNA reacción con su borde.
//

import SwiftUI

// MARK: - SinopsisView (la pestaña)

struct SinopsisView: View {

    // Recibe el ViewModel compartido (lo creó InicioView)
    @ObservedObject var viewModel: BaticaveViewModel

    // Requisito 7: posición del cómic seleccionado
    let indice: Int

    var body: some View {

        // ScrollView vertical: por si el texto no cabe en pantallas chicas
        ScrollView {

            // alignment: .leading = todo alineado a la izquierda
            VStack(alignment: .leading, spacing: 16) {

                Text("Sinopsis")
                    .font(.title2)
                    .bold()

                // Requisito 8: la sinopsis del cómic seleccionado
                Text(viewModel.comics[indice].sinopsis)

                // Requisito 9: texto debajo de la descripción
                Text("¿Qué te pareció el comic?")
                    .font(.headline)

                // Requisito 11: las 7 en UNA fila; si no caben, scroll horizontal
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {

                        // Requisito 10: una imagen por cada reacción
                        // (la lista de reacciones vive en el ViewModel)
                        ForEach(viewModel.reacciones) { reaccion in

                            // Button: algo que hace una acción al tocarlo
                            Button {
                                // Requisitos 14 y 15: la vista solo AVISA.
                                // La lógica (elegir / quitar) está en el ViewModel.
                                viewModel.tocarReaccion(reaccion.nombre, indiceComic: indice)
                            } label: {
                                // Lo que se ve: el componente hijo ReaccionView.
                                // Le preguntamos al ViewModel si esta es la elegida.
                                ReaccionView(
                                    reaccion: reaccion,
                                    seleccionada: viewModel.estaSeleccionada(reaccion.nombre, indiceComic: indice)
                                )
                            }
                            // .plain: que el botón no se pinte azul ni tenga fondo
                            .buttonStyle(.plain)
                        }
                    }
                    // pequeño margen para que el borde grueso no se corte
                    .padding(4)
                }
            }
            .padding()
        }
    }
}

// MARK: - ReaccionView (componente hijo)

// Dibuja UNA reacción: imagen, nombre y borde redondeado.
// Solo MUESTRA: recibe los datos y los pinta, no cambia nada.
struct ReaccionView: View {

    let reaccion: Reaccion     // qué reacción dibujar
    let seleccionada: Bool     // true = es la elegida (borde distinto)

    var body: some View {
        VStack(spacing: 4) {
            Image(reaccion.imagen)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)

            Text(reaccion.nombre)
                .font(.caption)
        }
        .padding(8)
        // Requisito 12: borde con esquinas redondeadas.
        // .overlay pone el borde ENCIMA de la reacción;
        // .stroke dibuja solo la orilla (no la rellena).
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    // Requisito 13: azul si es la elegida, gris (predeterminado) si no.
                    // condición ? siEsVerdad : siEsFalso
                    seleccionada ? Color.blue : Color.gray,
                    // la elegida también tiene el borde más grueso
                    lineWidth: seleccionada ? 3 : 1
                )
        )
    }
}

#Preview {
    SinopsisView(viewModel: BaticaveViewModel(), indice: 0)
}
