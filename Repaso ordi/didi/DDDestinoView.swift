import SwiftUI

struct DDDestinoView: View {
    @State private var origen = "Mi ubicación"
    @State private var destino = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Planea tu viaje")
                    .font(.title)
                    .bold()

                HStack(alignment: .top, spacing: 12) {
                    // Los puntos y la línea ilustran el orden del recorrido.
                    VStack(spacing: 5) {
                        Circle()
                            .fill(.orange)
                            .frame(width: 12, height: 12)
                        Rectangle()
                            .fill(Color.gray.opacity(0.4))
                            .frame(width: 2, height: 38)
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.primary)
                            .frame(width: 12, height: 12)
                    }
                    .padding(.top, 17)

                    VStack(spacing: 12) {
                        TextField("Punto de partida", text: $origen)
                            .padding(14)
                            .background(Color.gray.opacity(0.12))
                            .clipShape(RoundedRectangle(cornerRadius: 10))

                        TextField("¿A dónde vas?", text: $destino)
                            .padding(14)
                            .background(Color.gray.opacity(0.12))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }

                DDMapaView()

                Text("Lugares guardados")
                    .font(.headline)

                DDLugarView(icono: "house.fill", titulo: "Casa", descripcion: "Agregar dirección")
                DDLugarView(icono: "briefcase.fill", titulo: "Trabajo", descripcion: "Agregar dirección")
            }
            .padding()
        }
        .navigationTitle("Destino")
    }
}

#Preview {
    NavigationStack {
        DDDestinoView()
    }
}
