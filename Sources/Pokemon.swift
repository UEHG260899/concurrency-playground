import Foundation

public struct Pokemon: Decodable {
    let id: Int64
    let name: String
    let weight: Float
    let height: Float
}
