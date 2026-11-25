import SwiftUI

struct DDMapaView: View {
    var body: some View {
        // Las calles y los marcadores son una composición estática, sin GPS.
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray.opacity(0.16))

            VStack(spacing: 12) {
                HStack(spacing: 12) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.green.opacity(0.23))
                        .frame(width: 90, height: 65)
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.16))
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.green.opacity(0.20))
                        .frame(width: 65)
                }
                Rectangle().fill(.white).frame(height: 14)
                HStack(spacing: 12) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.18))
                    Rectangle().fill(.white).frame(width: 16)
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.green.opacity(0.20))
                    Rectangle().fill(.white).frame(width: 12)
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.18))
                }
                Rectangle().fill(.white).frame(height: 18)
                HStack(spacing: 12) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.green.opacity(0.22))
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.18))
                }
            }
            .padding(12)

            VStack {
                HStack {
                    Text("Centro")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    Spacer()
                    Image(systemName: "car.fill")
                        .foregroundStyle(.gray)
                }
                Spacer()
                VStack(spacing: 0) {
                    Text("Tu ubicación")
                        .font(.caption)
                        .bold()
                        .padding(8)
                        .background(Color.white)
                        .foregroundStyle(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    Image(systemName: "mappin.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.orange)
                }
                Spacer()
                HStack {
                    Image(systemName: "car.fill")
                        .foregroundStyle(.gray)
                    Spacer()
                    Image(systemName: "location.fill")
                        .padding(12)
                        .background(Color.white)
                        .foregroundStyle(.orange)
                        .clipShape(Circle())
                }
            }
            .padding(18)
        }
        .frame(height: 245)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    DDMapaView().padding()
}
