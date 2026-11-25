//
//  WAModelo.swift
//  Repaso ordi — Práctica 4: mensajería (carpeta whatsapp)
//
//  ─────────────────────────────────────────────────────────────────────
//  ROL EN MVVM: MODEL.
//  Los "moldes" de los datos: mensaje, chat, estado y llamada.
//  Solo guardan datos. Los datos inventados están en WAViewModel.swift.
//  ─────────────────────────────────────────────────────────────────────
//

import SwiftUI   // por el tipo Color

// MARK: - WAMensaje

// TEMA: MVVM (Model)
struct WAMensaje: Identifiable {
    let id = UUID()
    let texto: String
    let hora: String         // "10:42"
    let esMio: Bool          // true = lo envié yo (derecha), false = el contacto (izquierda)
}

// MARK: - WAChat

struct WAChat: Identifiable {
    let id = UUID()
    let nombre: String
    let iniciales: String
    let color: Color

    // "var": cambian (envío mensajes / se leen los mensajes)
    var mensajes: [WAMensaje]
    var noLeidos: Int

    // Propiedad calculada: el texto del ÚLTIMO mensaje.
    // No se guarda: se calcula cada vez que se pide. Por eso, al enviar un
    // mensaje nuevo, la lista de chats lo muestra sola (Requisito 6).
    var ultimoMensaje: String {
        if mensajes.count == 0 {
            return ""
        }
        // la última posición es count - 1
        return mensajes[mensajes.count - 1].texto
    }

    // Igual, pero la hora del último mensaje
    var horaUltimo: String {
        if mensajes.count == 0 {
            return ""
        }
        return mensajes[mensajes.count - 1].hora
    }
}

// MARK: - WAEstado (pestaña Novedades)

struct WAEstado: Identifiable {
    let id = UUID()
    let nombre: String
    let iniciales: String
    let color: Color
    let hora: String
}

// MARK: - WALlamada (pestaña Llamadas)

struct WALlamada: Identifiable {
    let id = UUID()
    let nombre: String
    let iniciales: String
    let color: Color
    let hora: String
    let entrante: Bool       // true = me llamaron, false = yo llamé
}
