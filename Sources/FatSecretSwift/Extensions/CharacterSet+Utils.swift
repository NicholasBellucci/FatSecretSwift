import Foundation

internal extension CharacterSet {
    /**
    Percent encodes string based on the URL encoding process described in RFC 3986.
     https://tools.ietf.org/html/rfc3986#section-2.4
     */
    var percentEncoded: CharacterSet {
        get { return CharacterSet.init(charactersIn: String().getPercentEncodingCharacterSet()) }
    }
}
