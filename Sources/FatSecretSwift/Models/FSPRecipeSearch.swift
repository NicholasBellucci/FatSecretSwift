//
//  FSPRecipeSearch.swift   (FSP = FatSecretPlatform)
//
//
//  Created by Fern Botelho on 12/19/22.
//
//
//    MIT License
//
//    Copyright (c) 2022 Fernando Botelho.
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.

import Foundation

/** A root struct for decoding FatSecretSwift recipe search JSON data. */
public struct FSPRecipeSearch: Codable, Hashable {
    public let recipes: FSPRecipes
}

/** A child struct of FSPRecipeSearch for decoding FatSecretSwift Recipe Search JSON. */
public struct FSPRecipes: Codable, Hashable {
    public let recipe: [FSPRecipe]
}


/** An FSPRecipes.recipe array item type for decoding FatSecretSwift Recipe Search JSON. */
public struct FSPRecipe: Codable, Hashable {
    public let recipe_description: String?
    public let recipe_id: String?
    public let recipe_image: URL?
    public let recipe_ingredients: FSPIngredient?
    public let recipe_name: String?
    public let recipe_nutrition: FSPNutrition?
    public let recipe_types: FSPRecipeType?
}


/** A type that is a 'recipe_ingredients' property of FSPRecipe, for decoding FatSecretSwift Recipe Search JSON. */
public struct FSPIngredient: Codable, Hashable {
    public let ingredient: [String]?
}


extension FSPIngredient {
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case ingredient
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            let ingredients = try container.decode([String].self, forKey: .ingredient)
            self.init(ingredient: ingredients)
        } catch {
            let ingredient = try container.decode(String.self, forKey: .ingredient)
            self.init(ingredient: [ingredient])
        }
    }
}

/** A type that is a 'recipe_nutritrion' property of FSPRecipe, for decoding FatSecretSwift Recipe Search JSON. Note: Using custum decoder in extension to convert decoded JSON String values in optional Double values. */
public struct FSPNutrition: Codable, Hashable {
    public let calories: Double?
    public let carbohydrate: Double?
    public let fat: Double?
    public let protein: Double?
}


/** A type that is a 'recipe_types' property of FSPRecipe, for decoding FatSecretSwift Recipe Search JSON. 'recipe_type' in FSPRecipeType uses a custom decoder init(from decoder:) in extension to FSPRecipeType, as 'recipe_type' may be a String or Array< String >. */
public struct FSPRecipeType: Codable, Hashable {
    public let recipe_type: [String]?
}



extension FSPRecipeType {
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case recipe_type
    }
    
    public init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)
        do {
            let recipeTypes = try container.decode([String].self, forKey: .recipe_type)
            self.init(recipe_type: recipeTypes)
        } catch {
            let recipeType = try container.decode(String.self, forKey: .recipe_type)
            self.init(recipe_type: [recipeType])
        }
    }

}


extension FSPNutrition {
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case calories, carbohydrate, fat, protein
    }
    
    public init(from decoder: Decoder) throws {
        do {
            let container       = try decoder.container(keyedBy: CodingKeys.self)
            let calories        = (try? container.decode(String.self, forKey: .calories)) ?? ""
            let carbohydrate    = (try? container.decode(String.self, forKey: .carbohydrate)) ?? ""
            let fat             = (try? container.decode(String.self, forKey: .fat)) ?? ""
            let protein         = (try? container.decode(String.self, forKey: .protein)) ?? ""
            // Convert decoded Strings as Doubles
            self.init(calories: Double(calories), carbohydrate: Double(carbohydrate), fat: Double(fat), protein: Double(protein))
        } catch {
            self.init(calories: 0.0, carbohydrate: 0.0, fat: 0.0, protein: 0.0)
        }
    }
    
    
}
