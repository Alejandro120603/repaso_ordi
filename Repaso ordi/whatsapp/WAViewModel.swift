//
//  WAViewModel.swift
//  Repaso ordi — Práctica 4: mensajería (carpeta whatsapp)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: VIEWMODEL.
//  DUEÑO de los datos (inventados): chats con sus mensajes, estados y
//  llamadas.
//  Lógica:
//   - enviar(...): agrega un mensaje mío a un chat (Requisito 5).
//   - marcarComoLeido(...): pone en cero los no leídos (Requisito 3).
//  Las vistas NO cambian los mensajes directamente: se lo piden aquí.
//  Estilo del profesor: clase con @Observable y @MainActor.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI

// TEMA: MVVM (ViewModel)
@MainActor
@Observable
class WAViewModel {

    // ---------- Chats ----------
    var chats: [WAChat] = [
        WAChat(nombre: "Mamá", iniciales: "M", color: .pink, mensajes: [
            WAMensaje(texto: "¿Ya comiste?", hora: "13:02", esMio: false),
            WAMensaje(texto: "Sí, ahorita en la escuela", hora: "13:05", esMio: true),
            WAMensaje(texto: "Ok, no llegues tarde 😊", hora: "13:06", esMio: false)
        ], noLeidos: 1),

        WAChat(nombre: "Equipo de Móviles", iniciales: "EM", color: .blue, mensajes: [
            WAMensaje(texto: "¿Quién hace la pantalla de perfil?", hora: "11:20", esMio: false),
            WAMensaje(texto: "Yo la hago", hora: "11:22", esMio: true),
            WAMensaje(texto: "Va, yo hago la lista", hora: "11:25", esMio: false),
            WAMensaje(texto: "No olviden el @Binding 😅", hora: "11:30", esMio: false)
        ], noLeidos: 3),

        WAChat(nombre: "Carlos Ruiz", iniciales: "CR", color: .orange, mensajes: [
            WAMensaje(texto: "¿Vamos al partido el sábado?", hora: "Ayer", esMio: false),
            WAMensaje(texto: "¡Claro! ¿A qué hora?", hora: "Ayer", esMio: true)
        ], noLeidos: 0),

        WAChat(nombre: "Ana López", iniciales: "AL", color: .purple, mensajes: [
            WAMensaje(texto: "Te paso los apuntes de la clase", hora: "Ayer", esMio: false),
            WAMensaje(texto: "Muchas gracias 🙌", hora: "Ayer", esMio: true),
            WAMensaje(texto: "De nada. Mucha suerte en el ordinario, ojalá que nos vaya muy bien a todos", hora: "Ayer", esMio: false)
        ], noLeidos: 2),

        WAChat(nombre: "Luis Pérez", iniciales: "LP", color: .green, mensajes: [
            WAMensaje(texto: "Ya llegué", hora: "Lunes", esMio: false)
        ], noLeidos: 0)
    ]

    // ---------- Estados (Novedades) ----------
    let estados: [WAEstado] = [
        WAEstado(nombre: "Ana López", iniciales: "AL", color: .purple, hora: "Hace 10 min"),
        WAEstado(nombre: "Carlos Ruiz", iniciales: "CR", color: .orange, hora: "Hace 1 h"),
        WAEstado(nombre: "Sofía M.", iniciales: "SM", color: .teal, hora: "Hace 3 h"),
        WAEstado(nombre: "Luis Pérez", iniciales: "LP", color: .green, hora: "Hoy, 8:15"),
        WAEstado(nombre: "Mamá", iniciales: "M", color: .pink, hora: "Ayer")
    ]

    // ---------- Llamadas ----------
    let llamadas: [WALlamada] = [
        WALlamada(nombre: "Mamá", iniciales: "M", color: .pink, hora: "Hoy, 12:40", entrante: true),
        WALlamada(nombre: "Carlos Ruiz", iniciales: "CR", color: .orange, hora: "Hoy, 9:15", entrante: false),
        WALlamada(nombre: "Ana López", iniciales: "AL", color: .purple, hora: "Ayer, 20:03", entrante: true),
        WALlamada(nombre: "Luis Pérez", iniciales: "LP", color: .green, hora: "Lunes, 18:30", entrante: false)
    ]

    // MARK: - Lógica

    // Requisito 5: agrega un mensaje MÍO al final del chat indicado.
    // - texto: lo que escribí
    // - indiceChat: posición del chat en el arreglo "chats"
    func enviar(_ texto: String, indiceChat: Int) {

        // no enviamos mensajes vacíos
        if texto == "" {
            return
        }

        let nuevo = WAMensaje(texto: texto, hora: "Ahora", esMio: true)

        // append: agrega al final. Como "chats" es parte de un @Observable,
        // la conversación y la lista de chats se redibujan solas.
        chats[indiceChat].mensajes.append(nuevo)
    }

    // Requisito 3: al abrir un chat, sus no leídos pasan a cero
    func marcarComoLeido(indiceChat: Int) {
        chats[indiceChat].noLeidos = 0
    }
}
