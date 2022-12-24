//
//  FSPRecipeID.swift  (FSP = FatSecretPlatform)
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

/** root struct for decoding FatSecretSwift Recipe ID Search JSON data. */
public struct FSPRecipeIDSearch: Codable, Hashable {
    public let recipe: FSPSingleRecipe
}


/** A type that is a recipe property of FSPRecipeIDSearch for decoding FatSecretSwift Recipe ID Search JSON. */
public struct FSPSingleRecipe: Codable, Hashable {
    public let cooking_time_min: String?
    public let directions: Directions?
    public let ingredients: Ingredients
    
    public let number_of_servings: String
    public let preparation_time_min: String
    public let rating: String?
    
    public let recipe_categories: RecipeCategories?
    public let recipe_description: String
    public let recipe_id: String
    public let recipe_images: RecipeImage
    public let recipe_name: String
    public let recipe_types: RecipeTypes?
    public let recipe_url: URL?
    
    public let serving_sizes: FSPRecipeServing
}


/** A type that is a 'directions' property of FSPSingleRecipe, for decoding FatSecretSwift Recipe ID Search JSON. */
public struct Directions: Codable, Hashable {
    public let direction: [Direction]
}


extension Directions {
    public enum CodingKeys: String, CodingKey, Hashable {
        case direction
    }
    
    public init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                let directions = try container.decode([Direction].self, forKey: .direction)
                self.init(direction: directions)
            } catch {
                let direction = try container.decode(Direction.self, forKey: .direction)
                self.init(direction: [direction])
            }
        } catch {
            self.init(direction: [Direction(direction_description: "n/a", direction_number: "0")])
        }
    }
}


/** A Directions.direction array item type for decoding FatSecretSwift Recipe ID Search JSON. */
public struct Direction: Codable, Hashable {
    public let direction_description: String
    public let direction_number: String
}


/** A type that is an 'ingredients' property of FSPSingleRecipe, for decoding FatSecretSwift Recipe ID Search JSON. */
public struct Ingredients: Codable, Hashable {
    public let ingredient: [Ingredient]
}


/** An Ingredients.ingredient array item type for decoding FatSecretSwift Recipe ID Search JSON. */
public struct Ingredient: Codable, Hashable {
    public let food_id: String
    public let food_name: String
    public let ingredient_description: String
    public let ingredient_url: URL
    public let measurement_description: String
    public let number_of_units: String
    public let serving_id: String
}


/** A type that is a 'recipe_categories' property of FSPSingleRecipe, for decoding FatSecretSwift Recipe ID Search JSON. */
public struct RecipeCategories: Codable, Hashable {
    public let recipe_category: [RecipeCategory]
}


extension RecipeCategories {
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case recipe_category
    }
    
    public init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                let recipeCategories = try container.decode([RecipeCategory].self, forKey: .recipe_category)
                self.init(recipe_category: recipeCategories)
            } catch {
                let recipeCategory = try container.decode(RecipeCategory.self, forKey: .recipe_category)
                self.init(recipe_category: [recipeCategory])
            }
        } catch {
            self.init(recipe_category: [RecipeCategory(recipe_category_name: "no category name", recipe_category_url: nil)])
        }
    }
}


/** A RecipeCategories.recipe_category array item type for decoding FatSecretSwift Recipe ID JSON. */
public struct RecipeCategory: Codable, Hashable {
    public let recipe_category_name: String
    public let recipe_category_url: URL?
}


/** A type that is a 'recipe_images' property of FSPSingleRecipe, for decoding FatSecretSwift Recipe ID JSON. */
public struct RecipeImage: Codable, Hashable {
    public let recipe_image: [URL]?
}


extension RecipeImage {
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case recipe_image
    }
    
    public init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                let recipeImages = try container.decode([URL].self, forKey: .recipe_image)
                self.init(recipe_image: recipeImages)
            } catch {
                let recipeImage = try container.decode(URL.self, forKey: .recipe_image)
                self.init(recipe_image: [recipeImage])
            }
        } catch {
            self.init(recipe_image: nil)
        }
    }
}


/** A type that is a 'recipe_types' property of FSPSingleRecipe, for decoding FatSecretSwift Recipe ID JSON. */
public struct RecipeTypes: Codable, Hashable {
    public let recipe_type: [String]
}


extension RecipeTypes {
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case recipe_type
    }
    
    public init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                let recipeType  = try container.decode([String].self, forKey: .recipe_type)
                self.init(recipe_type: recipeType)
            } catch {
                let recipeStringType = (try? container.decode(String.self, forKey: .recipe_type)) ?? ""
                let recipeType = [recipeStringType]
                self.init(recipe_type: recipeType)
            }
        } catch {
            self.init(recipe_type: ["n/a"])
        }
    }
}



/** A type that is a 'serving_sizes' property of FSPSingleRecipe, for decoding FatSecretSwift Recipe ID JSON. */
public struct FSPRecipeServing: Codable, Hashable {
    public let serving: FSPRecipeServingInfo
}


/** A type that is a 'serving' property of FSPSingleRecipe, for decoding FatSecretSwift Recipe ID JSON. Note: Using custum decoder in extension to convert decoded JSON String values in optional Double values. */
public struct FSPRecipeServingInfo: Codable, Hashable {
    public let calcium: Double?
    public let calories: Double?
    public let carbohydrate: Double?
    public let cholesterol: Double?
    public let fat: Double?
    public let fiber: Double?
    public let iron: Double?
    public let monounsaturated_fat: Double?
    public let polyunsaturated_fat: Double?
    public let potassium: Double?
    public let protein: Double?
    public let saturated_fat: Double?
    
    public let serving_size: Double?
    
    public let sodium: Double?
    public let sugar: Double?
    public let trans_fat: Double?
    public let vitamin_a: Double?
    public let vitamin_c: Double?
}


extension FSPRecipeServingInfo {
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case calcium
        case calories
        case carbohydrate
        case cholesterol
        case fat
        case fiber
        case iron
        case monounsaturated_fat
        case polyunsaturated_fat
        case potassium
        case protein
        case saturated_fat
        
        case serving_size
        
        case sodium
        case sugar
        case trans_fat
        case vitamin_a
        case vitamin_c
    }
    
    
    public init(from decoder: Decoder) throws {
        do {
            let container           = try decoder.container(keyedBy: CodingKeys.self)
            let calcium             = (try? container.decode(String.self, forKey: .calcium)) ?? ""
            let calories            = (try? container.decode(String.self, forKey: .calories)) ?? ""
            let carbohydrate        = (try? container.decode(String.self, forKey: .carbohydrate)) ?? ""
            let cholesterol         = (try? container.decode(String.self, forKey: .cholesterol)) ?? ""
            let fat                 = (try? container.decode(String.self, forKey: .fat)) ?? ""
            let fiber               = (try? container.decode(String.self, forKey: .fiber)) ?? ""
            let iron                = (try? container.decode(String.self, forKey: .iron)) ?? ""
            let monounsaturated_fat = (try? container.decode(String.self, forKey: .monounsaturated_fat)) ?? ""
            let polyunsaturated_fat = (try? container.decode(String.self, forKey: .polyunsaturated_fat)) ?? ""
            let potassium           = (try? container.decode(String.self, forKey: .potassium)) ?? ""
            let protein             = (try? container.decode(String.self, forKey: .protein)) ?? ""
            let saturated_fat       = (try? container.decode(String.self, forKey: .saturated_fat)) ?? ""
        
            let serving_size        = (try? container.decode(String.self, forKey: .serving_size)) ?? ""
        
            let sodium              = (try? container.decode(String.self, forKey: .sodium)) ?? ""
            let sugar               = (try? container.decode(String.self, forKey: .sugar)) ?? ""
            let trans_fat           = (try? container.decode(String.self, forKey: .trans_fat)) ?? ""
            let vitamin_a           = (try? container.decode(String.self, forKey: .vitamin_a)) ?? ""
            let vitamin_c           = (try? container.decode(String.self, forKey: .vitamin_c)) ?? ""
            
            // Convert decoded Strings as Doubles
            self.init(calcium: Double(calcium), calories: Double(calories), carbohydrate: Double(carbohydrate), cholesterol: Double(cholesterol), fat: Double(fat), fiber: Double(fiber), iron: Double(iron), monounsaturated_fat: Double(monounsaturated_fat), polyunsaturated_fat: Double(polyunsaturated_fat), potassium: Double(potassium), protein: Double(protein), saturated_fat: Double(saturated_fat), serving_size: Double(serving_size), sodium: Double(sodium), sugar: Double(sugar), trans_fat: Double(trans_fat), vitamin_a: Double(vitamin_a), vitamin_c: Double(vitamin_c))
        } catch {
            // If unable to decode 'container' then function returns 0.0 for all properties
            self.init(calcium: 0.0, calories: 0.0, carbohydrate: 0.0, cholesterol: 0.0, fat: 0.0, fiber: 0.0, iron: 0.0, monounsaturated_fat: 0.0, polyunsaturated_fat: 0.0, potassium: 0.0, protein: 0.0, saturated_fat: 0.0, serving_size: 0.0, sodium: 0.0, sugar: 0.0, trans_fat: 0.0, vitamin_a: 0.0, vitamin_c: 0.0)
        }
    }
    
}
