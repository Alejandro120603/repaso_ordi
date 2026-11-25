//
//  YTBotonGuardar.swift
//  Repaso ordi — Práctica 5: videos (carpeta youtube)
//

import SwiftUI

// TEMA: @Binding. Biblioteca verá el cambio en el mismo modelo.
struct YTBotonGuardar: View {
    @Binding var guardado: Bool

    var body: some View {
        Button {
            guardado.toggle()
        } label: {
            Label(guardado ? "Guardado" : "Guardar",
                  systemImage: guardado ? "bookmark.fill" : "bookmark")
                .foregroundStyle(guardado ? Color.red : Color.primary)
                .padding(10)
                .background(Color.gray.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(.plain)
    }
}
