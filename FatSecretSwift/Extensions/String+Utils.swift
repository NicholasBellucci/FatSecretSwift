//
//  String+Utils.swift
//  FatSecretSwift
//
//  Created by Nicholas Bellucci on 10/11/18.
//  Copyright © 2018 Nicholas Bellucci. All rights reserved.
//

import UIKit
import CryptoSwift

internal extension String {
    // String set for URL encoding process described in RFC 3986
    // Also refered to as percent encoding
    func getPercentEncodingCharacterSet() -> String {
        let digits = "0123456789"
        let lowercase = "abcdefghijklmnopqrstuvwxyz"
        let uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let unreserved = "-._~"

        return digits + lowercase + uppercase + unreserved
    }

    // Reserved character set for URL as described in RFC 3986
    // These characters are reserved for a URL but we need to percent encode when creating the OAuth Signature
    func replaceReservedCharacters() -> String {
        return addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: ":/?#[]@!$&'()*+,;= ").inverted)!
    }

    // Creates the signature string based on the consumer key and signature base string
    // Uses HMAC-SHA1 encryption
    func getSignature(key: String, params: String) -> String {
        var array = [UInt8]()
        array += params.utf8

        let sign = try! HMAC(key: key, variant: .sha1).authenticate(array).toBase64()!

        return sign
    }

    // Determines if string contains another string
    // Returns boolean value
    func contains(find: String) -> Bool{ return self.range(of: find) != nil }
}
