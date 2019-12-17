public struct Search: Decodable {
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case foods = "food"
    }

    public let foods: [SearchedFood]

    public init(foods: [SearchedFood]) {
        self.foods = foods
    }
}
