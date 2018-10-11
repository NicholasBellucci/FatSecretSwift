//
//  Search.swift
//  FatSecretSwift
//
//  Created by Nicholas Bellucci on 10/11/18.
//  Copyright © 2018 Nicholas Bellucci. All rights reserved.
//

import Foundation

public struct Search: Decodable {
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case foods = "food"
    }

    public let foods: [SearchedFood]

    public init(foods: [SearchedFood]) {
        self.foods = foods
    }
}
