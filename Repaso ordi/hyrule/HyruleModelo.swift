import SwiftUI

struct HyruleRespuesta: Codable {
    let data: [HyruleMonstruo]
}

struct HyruleMonstruo: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let description: String
    let common_locations: [String]?
    let drops: [String]?
}
