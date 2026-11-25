//
//  YTBotonPlay.swift
//  Repaso ordi — Práctica 5: videos (carpeta youtube)
//

import SwiftUI

// TEMA: @Binding. El estado pertenece a YTDetalleView.
struct YTBotonPlay: View {
    @Binding var reproduciendo: Bool

    var body: some View {
        Button {
            reproduciendo.toggle()
        } label: {
            Image(systemName: reproduciendo ? "pause.fill" : "play.fill")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .frame(width: 65, height: 65)
                .background(Color.black.opacity(0.65))
                .clipShape(Circle())
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    YTBotonPlay(reproduciendo: .constant(false))
}
