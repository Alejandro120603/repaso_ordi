import SwiftUI

@MainActor
@Observable
class HyruleViewModel {
    var monstruos: [HyruleMonstruo] = []
    var cargando = true
    var mensajeError = ""

    func cargarMonstruos() async {
        if !monstruos.isEmpty {
            return
        }

        cargando = true
        mensajeError = ""

        guard let url = URL(string: "https://api.hyrule-compendium.com/v3/compendium/category/monsters") else {
            mensajeError = "URL no válida."
            cargando = false
            return
        }

        do {
            let (datos, _) = try await URLSession.shared.data(from: url)
            let respuesta = try JSONDecoder().decode(HyruleRespuesta.self, from: datos)
            monstruos = respuesta.data
        } catch {
            mensajeError = "No se pudieron cargar los monstruos."
        }

        cargando = false
    }
}
