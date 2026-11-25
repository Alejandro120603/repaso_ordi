//
//  FBBotonMeGusta.swift
//  Repaso ordi — Práctica 1: red social con feed (carpeta facebook)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEW (componente con @Binding).
//  Requisito 4: el botón "Me gusta". Al tocarlo:
//   - cambia de color (gris ↔ azul) con animación
//   - el contador de la publicación sube o baja en 1
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

struct FBBotonMeGusta: View {

    // TEMA: @Binding
    // DUEÑO de estos datos: FBViewModel (dentro de cada FBPublicacion).
    // Este botón NO es dueño: solo los MODIFICA. Por eso usa @Binding y no
    // @State. Si usara @State, el cambio se quedaría en el botón y el
    // contador de la publicación no se enteraría.
    @Binding var leDiMeGusta: Bool
    @Binding var meGustas: Int

    var body: some View {
        Button {
            // TEMA: withAnimation — el cambio de color se anima
            withAnimation {
                if leDiMeGusta {
                    // ya le había dado Me gusta → lo quito y resto 1
                    leDiMeGusta = false
                    meGustas -= 1
                } else {
                    // no le había dado → lo doy y sumo 1
                    leDiMeGusta = true
                    meGustas += 1
                }
            }
        } label: {
            // condición ? siEsVerdad : siEsFalso
            Label("Me gusta", systemImage: leDiMeGusta ? "hand.thumbsup.fill" : "hand.thumbsup")
                .foregroundStyle(leDiMeGusta ? Color.blue : Color.gray)
                .bold()
        }
        // .plain: sin el fondo de botón por defecto
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack(spacing: 20) {
        FBBotonMeGusta(leDiMeGusta: .constant(false), meGustas: .constant(10))
        FBBotonMeGusta(leDiMeGusta: .constant(true), meGustas: .constant(11))
    }
}
