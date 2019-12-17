public struct Food: Decodable {
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id = "food_id"
        case name = "food_name"
        case type = "food_type"
        case url = "food_url"
        case servings
    }

    public let id: String
    public let name: String
    public let type: String
    public let url: String
    public let servings: Array<Serving>?

    public init(id: String, name: String, type: String, url: String, servings: [Serving]) {
        self.id = id
        self.name = name
        self.type = type
        self.url = url
        self.servings = servings
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(String.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let type = try container.decode(String.self, forKey: .type)
        let url = try container.decode(String.self, forKey: .url)

        do {
            let servings = try container.decode([String:Serving].self, forKey: .servings)
            let array = [servings["serving"]!]
            self.init(id: id, name: name, type: type, url: url, servings: array)
        } catch {
            let servings = try container.decode([String:[Serving]].self, forKey: .servings)
            let array = servings["serving"]!
            self.init(id: id, name: name, type: type, url: url, servings: array)
        }
    }
}
