//
//  Serving.swift
//  FatSecretSwift
//
//  Created by Nicholas Bellucci on 10/11/18.
//  Copyright © 2018 Nicholas Bellucci. All rights reserved.
//

import Foundation

public struct Serving: Decodable {
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case calcium, calories, carbohydrate, cholesterol, fat, fiber, iron, potassium, protein, sodium, sugar
        case monounsaturatedFat = "monounsaturated_fat"
        case polyunsaturatedFat = "polyunsaturated_fat"
        case saturatedFat = "saturated_fat"
        case transFat = "trans_fat"
        case vitaminA = "vitamin_a"
        case vitaminC = "vitamin_c"
    }

    public let calcium: String?
    public let calories: String?
    public let carbohydrate: String?
    public let cholesterol: String?
    public let fat: String?
    public let fiber: String?
    public let iron: String?
    public let monounsaturatedFat: String?
    public let polyunsaturatedFat: String?
    public let potassium: String?
    public let protein: String?
    public let saturatedFat: String?
    public let sodium: String?
    public let sugar: String?
    public let transFat: String?
    public let vitaminA: String?
    public let vitaminC: String?

    public init(calcium: String?, calories: String?, carbohydrate: String?, cholesterol: String?, fat: String?,
                fiber: String?, iron: String?, monounsaturatedFat: String?, polyunsaturatedFat: String?,
                potassium: String?, protein: String?, saturatedFat: String?, sodium: String?, sugar: String?,
                transFat: String?, vitaminA: String?, vitaminC: String?) {
        self.calcium = calcium
        self.calories = calories
        self.carbohydrate = carbohydrate
        self.cholesterol = cholesterol
        self.fat = fat
        self.fiber = fiber
        self.iron = iron
        self.monounsaturatedFat = monounsaturatedFat
        self.polyunsaturatedFat = polyunsaturatedFat
        self.potassium = potassium
        self.protein = protein
        self.saturatedFat = saturatedFat
        self.sodium = sodium
        self.sugar = sugar
        self.transFat = transFat
        self.vitaminA = vitaminA
        self.vitaminC = vitaminC
    }
}
