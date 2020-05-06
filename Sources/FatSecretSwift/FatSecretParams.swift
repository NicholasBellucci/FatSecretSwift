import Foundation

internal struct FatSecretParams {
    /// OAuth Parameters
    static var oAuth = ["oauth_consumer_key":"",
                        "oauth_signature_method":"HMAC-SHA1",
                        "oauth_timestamp":"",
                        "oauth_nonce":"",
                        "oauth_version":"1.0"] as Dictionary

    static var fatSecret = [:] as Dictionary<String, String>

    /// Fat Secret Consumer Secret Key
    static var key = ""

    /// Fat Secret API URL
    static let url = "https://platform.fatsecret.com/rest/server.api"

    /// Fat Secret HTTP Request Method
    static let httpType = "POST"
}
