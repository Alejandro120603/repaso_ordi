//
//  CapitulosView.swift
//  Repaso ordi — Segundo parcial (Baticave)
//
//  ======================  V I E W  (la "V" de MVVM)  ======================
//
//  Pestaña LISTA DE CAPÍTULOS.
//  - Lista (con scroll) de los capítulos del cómic seleccionado.
//  - Cada fila: corazón de favorito, "Nombre + número" y,
//    en una segunda línea, la cantidad de páginas.
//
//  En este archivo hay 2 vistas:
//    - CapitulosView: la pestaña completa.
//    - BotonFavorito: componente hijo con @Binding (el corazón).
//

import SwiftUI

// MARK: - CapitulosView (la pestaña)

struct CapitulosView: View {

    // Recibe el ViewModel compartido (lo creó InicioView)
    @ObservedObject var viewModel: BaticaveViewModel

    // Requisito 7: posición del cómic seleccionado
    let indice: Int

    var body: some View {

        // List: lista vertical que YA trae scroll incluido.
        // Recorremos las POSICIONES de los capítulos (0, 1, 2, 3, 4)
        // para poder darle al corazón un @Binding a SU capítulo.
        List(viewModel.comics[indice].capitulos.indices, id: \.self) { i in

            // HStack: corazón a la izquierda, textos a la derecha
            HStack(spacing: 12) {

                // Componente hijo con @Binding.
                // El signo $ crea un "enlace" (Binding) al dato del ViewModel:
                // el hijo puede LEER y CAMBIAR "esFavorito" de ESTE capítulo
                // y el cambio se guarda directamente en el ViewModel.
                BotonFavorito(esFavorito: $viewModel.comics[indice].capitulos[i].esFavorito)

                // VStack: dos líneas de texto, alineadas a la izquierda
                VStack(alignment: .leading, spacing: 4) {

                    // Línea 1: nombre del cómic + NÚMERO de capítulo
                    // (ej. "SuperMan 103")
                    Text("\(viewModel.comics[indice].nombre) \(viewModel.comics[indice].capitulos[i].numero)")
                        .font(.headline)

                    // Línea 2: cantidad de PÁGINAS (dato distinto al número)
                    // (ej. "35 páginas")
                    Text("\(viewModel.comics[indice].capitulos[i].paginas) páginas")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)   // gris, menos llamativo
                }
            }
            .padding(.vertical, 4)
        }
    }
}

// MARK: - BotonFavorito (componente hijo con @Binding)

// El corazón de cada capítulo.
// Empieza lleno o vacío según el favorito INICIAL del anexo,
// y al tocarlo se cambia (lleno <-> vacío).
struct BotonFavorito: View {

    // @Binding: este dato NO es del hijo; es del padre (en realidad, del ViewModel).
    // El hijo lo recibe "prestado" con $ y puede cambiarlo.
    // Diferencia con @State: @State = el dato vive en ESTA vista;
    //                        @Binding = el dato vive en OTRO lado y aquí solo se enlaza.
    @Binding var esFavorito: Bool

    var body: some View {
        Button {
            // toggle(): cambia true <-> false.
            // Como es @Binding, el cambio llega hasta el ViewModel.
            esFavorito.toggle()
        } label: {
            // "heart.fill" (lleno) si es favorito, "heart" (vacío) si no
            Image(systemName: esFavorito ? "heart.fill" : "heart")
                .foregroundStyle(.red)
                .font(.title2)
        }
        // .plain: para que la fila de la List no se vuelva toda un botón
        .buttonStyle(.plain)
    }
}

#Preview {
    // indice 1 = SuperMan, para ver favoritos y no favoritos
    CapitulosView(viewModel: BaticaveViewModel(), indice: 1)
}
