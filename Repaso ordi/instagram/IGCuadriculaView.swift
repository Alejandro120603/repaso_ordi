//
//  IGCuadriculaView.swift
//  Repaso ordi — Práctica 2: fotos e historias (carpeta instagram)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (componente reutilizable, sin @Binding).
//  Requisito 6: cuadrícula de 3 columnas hecha SOLO con VStack y HStack.
//  Se usa en Perfil y en Buscar.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct IGCuadriculaView: View {

    // TEMA: parámetros — un color por "foto"
    let fotos: [Color]

    var body: some View {

        // Idea: VStack de FILAS; cada fila es un HStack de 3 fotos.
        // Con 9 fotos → 3 filas (9 / 3 = 3).
        //
        // La foto de la fila "fila" y columna "columna" está en la posición:
        //     fila * 3 + columna
        // Ejemplo: fila 1, columna 2 → 1 * 3 + 2 = 5 (la sexta foto).
        VStack(spacing: 2) {

            // 0..<filas = 0, 1, 2, ... (sin incluir "filas")
            ForEach(0..<(fotos.count / 3), id: \.self) { fila in

                HStack(spacing: 2) {
                    ForEach(0..<3, id: \.self) { columna in
                        Rectangle()
                            .fill(fotos[fila * 3 + columna])
                            // cuadrado: alto = ancho
                            .aspectRatio(1, contentMode: .fit)
                            .overlay(
                                Image(systemName: "photo")
                                    .font(.title)
                                    .foregroundStyle(.white.opacity(0.7))
                            )
                    }
                }
            }
        }
    }
}

#Preview {
    IGCuadriculaView(fotos: IGViewModel().perfil.fotos)
}
