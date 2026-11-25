//
//  IGInicioView.swift
//  Repaso ordi — Práctica 2: fotos e historias (carpeta instagram)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (pestaña Inicio).
//  - Arriba: fila horizontal de historias (Requisito 2).
//  - Tocar una historia la abre y la marca como vista (Requisito 3).
//  - Debajo: feed vertical de publicaciones (Requisito 4).
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct IGInicioView: View {

    // TEMA: @Binding
    // DUEÑO de ambos datos: IGViewModel (lo creó IGContentView).
    // Esta pantalla solo los recibe prestados para volver a prestar a cada
    // historia y a cada publicación SU parte con $historias[i] / $publicaciones[i].
    @Binding var historias: [IGHistoria]
    @Binding var publicaciones: [IGPublicacion]

    var body: some View {

        // TEMA: Navigation
        NavigationStack {

            // Scroll vertical de toda la pantalla
            ScrollView {
                VStack(spacing: 16) {

                    // ---------- Fila de historias ----------
                    // Requisito 2: ScrollView(.horizontal) = se desliza de lado
                    ScrollView(.horizontal) {
                        HStack(spacing: 14) {

                            // TEMA: ForEach por posiciones, para usar $historias[indice]
                            ForEach(historias.indices, id: \.self) { indice in

                                // Requisito 3: al tocar, abre el detalle.
                                // Le pasamos la historia (para mostrarla) y un
                                // @Binding a SU "vista" (para marcarla).
                                NavigationLink {
                                    IGHistoriaDetalleView(historia: historias[indice],
                                                          vista: $historias[indice].vista)
                                } label: {
                                    IGHistoriaCirculoView(historia: historias[indice])
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                    }

                    // ---------- Feed de publicaciones ----------
                    // Requisito 4: una tarjeta por publicación
                    ForEach(publicaciones.indices, id: \.self) { indice in
                        IGPublicacionView(publicacion: $publicaciones[indice])
                    }
                }
            }
            .navigationTitle("Inicio")
        }
    }
}

// MARK: - IGHistoriaCirculoView (un círculo de historia)

// Solo MUESTRA una historia: círculo con borde y el nombre debajo.
struct IGHistoriaCirculoView: View {

    // TEMA: parámetros (solo lectura)
    let historia: IGHistoria

    var body: some View {
        VStack(spacing: 6) {
            Circle()
                .fill(historia.color)
                .frame(width: 70, height: 70)
                // iniciales encima del círculo
                .overlay(
                    Text(historia.iniciales)
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.white)
                )
                // TEMA: .overlay — Requisito 2: el borde de color.
                // Requisito 3: gris si ya la vi, rosa si no.
                // padding(-5) agranda el círculo del borde para que quede
                // separado de la foto (un "anillo" alrededor).
                .overlay(
                    Circle()
                        .stroke(historia.vista ? Color.gray : Color.pink, lineWidth: 3)
                        .padding(-5)
                )
                .padding(5)   // espacio para que el anillo no se corte

            Text(historia.usuario)
                .font(.caption)
                .lineLimit(1)
                .frame(width: 80)
        }
    }
}

#Preview {
    IGInicioView(historias: .constant(IGViewModel().historias),
                 publicaciones: .constant(IGViewModel().publicaciones))
}
