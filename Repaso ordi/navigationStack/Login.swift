import SwiftUI

struct Login: View {

    @State private var usuario = ""
    @State private var contrasena = ""
    @State private var mostrarError = false

    // cuando se vuelve true, salta a Pagina
    @State private var sesionIniciada = false

    let usuarioCorrecto = "daniel"
    let contrasenaCorrecta = "1234"

    var body: some View {
        // NavigationStack: permite saltar entre páginas
        NavigationStack {
            VStack(spacing: 20) {

                TextField("Usuario", text: $usuario)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()

                SecureField("Contraseña", text: $contrasena)
                    .textFieldStyle(.roundedBorder)

                if mostrarError {
                    Text("Usuario o contraseña incorrectos")
                        .foregroundStyle(.red)
                }

                Button("Entrar") {
                    if usuario == usuarioCorrecto && contrasena == contrasenaCorrecta {
                        mostrarError = false
                        contrasena = ""         // limpia el campo para cuando regrese
                        sesionIniciada = true   // SALTO DE IDA: va a Pagina
                    } else {
                        mostrarError = true
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
            .navigationTitle("Iniciar sesión")
            // a qué página saltar cuando sesionIniciada sea true
            .navigationDestination(isPresented: $sesionIniciada) {
                Pagina()
            }
        }
    }
}

#Preview {
    Login()
}
