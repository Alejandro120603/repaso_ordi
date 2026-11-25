import SwiftUI

struct HyruleInicioView: View {
    // El nombre se guarda automáticamente al modificar el campo.
    @AppStorage("hyruleNombre") private var nombre = ""
    @State private var comenzar = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()

                Text("Te llamas")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.yellow)

                TextField("Nombre", text: $nombre)
                    .padding(12)
                    .background(Color.black.opacity(0.65))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .foregroundStyle(.white)

                Button("Comenzar") {
                    comenzar = true
                }
                .padding()
                .background(Color.yellow)
                .foregroundStyle(.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))

                Spacer()
            }
            .padding(24)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .overlay(Color.black.opacity(0.65))
                    .ignoresSafeArea()
            }
            .navigationDestination(isPresented: $comenzar) {
                HyruleListaView(nombre: nombre)
            }
        }
        .preferredColorScheme(.dark)
        .tint(.yellow)
    }
}

#Preview {
    HyruleInicioView()
}
