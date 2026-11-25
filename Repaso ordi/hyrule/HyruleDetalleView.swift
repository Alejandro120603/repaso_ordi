import SwiftUI

struct HyruleDetalleView: View {
    let monstruo: HyruleMonstruo
    let nombre: String

    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                Text(monstruo.name.uppercased())
                    .font(.title)
                    .bold()

                AsyncImage(url: URL(string: monstruo.image)) { imagen in
                    imagen.resizable().scaledToFit()
                } placeholder: {
                    Rectangle().fill(Color.gray.opacity(0.3))
                }
                .frame(width: 240, height: 240)
                .clipShape(RoundedRectangle(cornerRadius: 8))

                Text("\(nombre), Hey Listen")
                    .font(.headline)

                Text(monstruo.description)
                    .multilineTextAlignment(.center)

                // Algunas entradas de la API no tienen ubicaciones o drops.
                if let lugares = monstruo.common_locations, !lugares.isEmpty {
                    Text("COMMON LOCATIONS")
                        .font(.title2)
                        .bold()

                    ForEach(lugares, id: \.self) { lugar in
                        Text(lugar.capitalized)
                    }
                }

                if let objetos = monstruo.drops, !objetos.isEmpty {
                    Text("DROPPABLE ITEMS")
                        .font(.title2)
                        .bold()

                    ForEach(objetos, id: \.self) { objeto in
                        Text(objeto.capitalized)
                    }
                }
            }
            .foregroundStyle(.yellow)
            .multilineTextAlignment(.center)
            .padding(20)
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
    }
}
