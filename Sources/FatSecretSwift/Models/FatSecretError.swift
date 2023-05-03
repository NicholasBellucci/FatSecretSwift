public struct FSError: Codable {
    let code: Int
    let message: String?
}


public enum FBError: String, Error {
    case unableToComplete       = "Unable to complete request. Please check internet connection."
    case unableToGetRecipes     = "No matches found. Recipe unavailable from on-line connection."
    case invalidResponse        = "Invalid response from server. Try again."
    case invalidData            = "The data received from server was invalid. Try again."
}
