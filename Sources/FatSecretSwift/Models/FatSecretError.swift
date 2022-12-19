public struct FSError: Codable {
    let code: Int
    let message: String?
}


public enum FBError: String, Error {
    case unableToComplete       = "Unable to comple request. Please check internet connection."
    case invalidResponse        = "Invalid response from server. Try again."
    case invalidData            = "The data received from server was invalid. Try again."
}
