import SwiftUI

struct DDInicioView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.orange)
                    Spacer()
                    Text("DiDi")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.orange)
                    Spacer()
                    Image(systemName: "bell")
                        .font(.title2)
                }

                DDMapaView()

                VStack(alignment: .leading, spacing: 12) {
                    Text("¿A dónde vamos?")
                        .font(.title2)
                        .bold()

                    NavigationLink {
                        DDDestinoView()
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.orange)
                            Text("Ingresa tu destino")
                                .foregroundStyle(.primary)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.gray)
                        }
                        .padding(16)
                        .background(Color.gray.opacity(0.12))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .buttonStyle(.plain)

                    DDLugarView(icono: "house.fill", titulo: "Casa", descripcion: "Agregar dirección")
                    DDLugarView(icono: "briefcase.fill", titulo: "Trabajo", descripcion: "Agregar dirección")
                }

                Text("Opciones de viaje")
                    .font(.title2)
                    .bold()

                HStack(spacing: 12) {
                    DDServicioView(icono: "car.fill", titulo: "Express", descripcion: "Viajes diarios")
                    DDServicioView(icono: "car.2.fill", titulo: "Comfort", descripcion: "Mayor comodidad")
                }

                HStack(spacing: 12) {
                    Image(systemName: "tag.fill")
                        .font(.title)
                        .foregroundStyle(.orange)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Promociones").bold()
                        Text("Descubre opciones para tu próximo viaje")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                }
                .padding()
                .background(Color.orange.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            .padding()
        }
        .navigationTitle("Viajes")
    }
}

#Preview {
    DDContentView()
}
