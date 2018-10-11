//
//  URLComponents+Utils.swift
//  FatSecretSwift
//
//  Created by Nicholas Bellucci on 10/11/18.
//  Copyright © 2018 Nicholas Bellucci. All rights reserved.
//

import Foundation

internal extension URLComponents {
    // Creates URLQueryItems for URLComponent
    // Used for HTTP request
    mutating func createItemsForURLComponentsObject(array: [(key: String, value: String)]) {
        var queryItems = [URLQueryItem]()

        for tuple in array {
            queryItems.append(URLQueryItem(name: tuple.key, value: tuple.value))
        }

        self.queryItems = queryItems
    }

    // Returns the url parameters concatenated together
    // Parameters are seperated by '&'
    func getURLParameters() -> String {
        let queryItems = self.queryItems!
        var params = ""

        for item in queryItems {
            let index = queryItems.index(of: item)

            if index != queryItems.endIndex - 1 {
                params.append(String(describing: "\(item)&"))
            } else {
                params.append(String(describing: item))
            }
        }

        return params
    }
}
