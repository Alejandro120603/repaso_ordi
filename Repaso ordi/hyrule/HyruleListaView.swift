import SwiftUI

struct HyruleListaView: View {
    let nombre: String
    @State private var viewModel = HyruleViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                Text("COMPENDIUM")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.yellow)

                if viewModel.cargando {
                    Text("Cargando...")
                        .foregroundStyle(.yellow)
                } else if viewModel.mensajeError != "" {
                    Text(viewModel.mensajeError)
                        .foregroundStyle(.yellow)
                } else {
                    ForEach(viewModel.monstruos) { monstruo in
                        NavigationLink {
                            HyruleDetalleView(monstruo: monstruo, nombre: nombre)
                        } label: {
                            HStack(spacing: 12) {
                                AsyncImage(url: URL(string: monstruo.image)) { imagen in
                                    imagen.resizable().scaledToFill()
                                } placeholder: {
                                    Rectangle().fill(Color.gray.opacity(0.3))
                                }
                                .frame(width: 65, height: 65)
                                .clipShape(RoundedRectangle(cornerRadius: 10))

                                VStack(alignment: .leading, spacing: 5) {
                                    Text(monstruo.name.capitalized)
                                        .font(.headline)
                                        .foregroundStyle(.yellow)

                                    Text("ID: \(monstruo.id)")
                                        .font(.caption)
                                        .foregroundStyle(.blue)
                                }

                                Spacer()
                            }
                            .padding(.vertical, 4)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
        .task {
            await viewModel.cargarMonstruos()
        }
    }
}
