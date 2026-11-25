//
//  IGViewModel.swift
//  Repaso ordi — Práctica 2: fotos e historias (carpeta instagram)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEWMODEL.
//  DUEÑO de todos los datos de la práctica (inventados, sin API):
//  historias (¿ya vista?), publicaciones (Me gusta, guardada), el perfil
//  (¿lo sigo?) y las fotos de Buscar.
//  Las vistas solo muestran; los botones con @Binding modifican estos datos.
//  Estilo del profesor: clase con @Observable y @MainActor.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

// TEMA: MVVM (ViewModel)
// @Observable: si cambia "vista" de una historia, el borde se redibuja solo.
@MainActor
@Observable
class IGViewModel {

    // ---------- Historias (todas empiezan sin ver) ----------
    var historias: [IGHistoria] = [
        IGHistoria(usuario: "luna.viajes", iniciales: "LV", color: .orange,
                   icono: "airplane", texto: "¡Aterrizando en la playa!", vista: false),
        IGHistoria(usuario: "beto.cocina", iniciales: "BC", color: .red,
                   icono: "fork.knife", texto: "Hoy toca pasta casera", vista: false),
        IGHistoria(usuario: "cami.dibuja", iniciales: "CT", color: .purple,
                   icono: "pencil.and.outline", texto: "Boceto nuevo en proceso", vista: false),
        IGHistoria(usuario: "dani.gym", iniciales: "DG", color: .green,
                   icono: "dumbbell.fill", texto: "Día de pierna 💪", vista: false),
        IGHistoria(usuario: "eli.musica", iniciales: "EM", color: .blue,
                   icono: "music.note", texto: "Ensayando para el concierto", vista: false),
        IGHistoria(usuario: "fer.gatos", iniciales: "FG", color: .brown,
                   icono: "pawprint.fill", texto: "Mi gato dormido otra vez", vista: false)
    ]

    // ---------- Publicaciones del feed ----------
    var publicaciones: [IGPublicacion] = [
        IGPublicacion(usuario: "luna.viajes", iniciales: "LV", colorAvatar: .orange,
                      colorImagen: .cyan, icono: "beach.umbrella.fill",
                      descripcion: "Primer día de vacaciones 🌊",
                      meGustas: 128, leDiMeGusta: false, guardada: false),
        IGPublicacion(usuario: "beto.cocina", iniciales: "BC", colorAvatar: .red,
                      colorImagen: .yellow, icono: "birthday.cake.fill",
                      descripcion: "Pastel de chocolate para el cumpleaños de mi hermana",
                      meGustas: 76, leDiMeGusta: true, guardada: false),
        IGPublicacion(usuario: "cami.dibuja", iniciales: "CT", colorAvatar: .purple,
                      colorImagen: .indigo, icono: "paintbrush.pointed.fill",
                      descripcion: "Terminé la ilustración de esta semana",
                      meGustas: 240, leDiMeGusta: false, guardada: true),
        IGPublicacion(usuario: "fer.gatos", iniciales: "FG", colorAvatar: .brown,
                      colorImagen: .mint, icono: "cat.fill",
                      descripcion: "Él manda en esta casa",
                      meGustas: 512, leDiMeGusta: false, guardada: false)
    ]

    // ---------- Perfil que se muestra en la pestaña Perfil ----------
    var perfil = IGPerfil(
        usuario: "cami.dibuja",
        nombre: "Camila Torres",
        iniciales: "CT",
        color: .purple,
        biografia: "Ilustradora ✏️ · Dibujo un poco cada día",
        seguidos: 180,
        fotos: [.purple, .pink, .indigo, .orange, .teal, .blue, .mint, .red, .yellow],
        seguidores: 1250,
        siguiendo: false
    )

    // ---------- Fotos de la pestaña Buscar ----------
    // "let": no cambian
    let fotosExplorar: [Color] = [.orange, .teal, .pink, .green, .blue, .purple,
                                  .yellow, .red, .indigo, .mint, .cyan, .brown]
}
