//
//  FatSecretCredentials.swift
//  FatSecretSwift
//
//  Created by Nicholas Bellucci on 10/11/18.
//  Copyright © 2018 Nicholas Bellucci. All rights reserved.
//

import Foundation

open class FatSecretCredentials {
    public init() {}

    public func setConsumerKey(_ key: String) {
        FatSecretParams.oAuth.updateValue(key, forKey: "oauth_consumer_key")
    }

    public func setSharedSecret(_ secret: String) {
        FatSecretParams.key = "\(secret)&"
    }
}
