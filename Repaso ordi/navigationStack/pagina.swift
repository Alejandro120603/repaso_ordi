import SwiftUI

struct Pagina: View {

    // dismiss: cierra esta página y regresa a la anterior
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("¡Entraste!")
                .font(.largeTitle)
                .bold()

            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .font(.system(size: 120))
                .foregroundStyle(.green)

            Button("Cerrar sesión") {
                dismiss()   // SALTO DE REGRESO: vuelve a Login
            }
            .padding()
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        // oculta el "< Atrás" automático; se regresa solo con el botón
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Pagina()
}
