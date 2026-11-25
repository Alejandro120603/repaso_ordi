//
//  YTBotonMeGusta.swift
//  Repaso ordi — Práctica 5: videos (carpeta youtube)
//

import SwiftUI

// TEMA: @Binding. Cambia el dato original del video.
struct YTBotonMeGusta: View {
    @Binding var meGusta: Bool

    var body: some View {
        Button {
            meGusta.toggle()
        } label: {
            Label("Me gusta", systemImage: meGusta ? "hand.thumbsup.fill" : "hand.thumbsup")
                .foregroundStyle(meGusta ? Color.red : Color.primary)
                .padding(10)
                .background(Color.gray.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(.plain)
    }
}
