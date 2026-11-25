import SwiftUI

// Las filas y tarjetas reciben sus datos como parámetros para reutilizar el diseño.
struct DDLugarView: View {
    let icono: String
    let titulo: String
    let descripcion: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icono)
                .foregroundStyle(.gray)
                .frame(width: 42, height: 42)
                .background(Color.gray.opacity(0.12))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text(titulo).bold()
                Text(descripcion)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
        }
        .padding(.vertical, 6)
    }
}

struct DDServicioView: View {
    let icono: String
    let titulo: String
    let descripcion: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: icono)
                .font(.system(size: 36))
                .foregroundStyle(.orange)
            Text(titulo).font(.headline)
            Text(descripcion)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background(Color.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}
