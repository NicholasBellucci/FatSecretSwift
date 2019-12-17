public struct FatSecretCredentials {
    public static func setConsumerKey(_ key: String) {
        FatSecretParams.oAuth.updateValue(key, forKey: "oauth_consumer_key")
    }

    public static func setSharedSecret(_ secret: String) {
        FatSecretParams.key = "\(secret)&"
    }
}
