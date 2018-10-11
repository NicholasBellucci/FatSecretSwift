//
//  SearchedFood.swift
//  FatSecretSwift
//
//  Created by Nicholas Bellucci on 10/11/18.
//  Copyright © 2018 Nicholas Bellucci. All rights reserved.
//

import Foundation

public struct SearchedFood: Decodable {
   public enum CodingKeys: String, CodingKey {
        case id = "food_id"
        case name = "food_name"
        case description = "food_description"
        case brand = "brand_name"
        case type = "food_type"
        case url = "food_url"
    }

    public let id: String
    public let name: String
    public let description: String
    public let brand: String?
    public let type: String
    public let url: String
}