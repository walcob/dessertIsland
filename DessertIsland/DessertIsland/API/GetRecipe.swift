//
//  GetRecipe.swift
//  DessertIsland
//
//  Created by Benjamin Walcott on 5/20/24.
//

import Foundation

private var lookupBaseUrl = "https://themealdb.com/api/json/v1/1/lookup.php?i="

func GetRecipe(recipeID:String) async -> Recipe {
    let apiCommandURL = "\(lookupBaseUrl)\(recipeID)"
    do{
        let recipes:RawRecipes = try await Fetch(urlString: apiCommandURL)
        return ConvertToRecipe(rawRecipe:recipes.meals[0])
    } catch{
        fatalError("Failed to load recipe ID \(recipeID)\n\(error)")
    }
}

func ConvertToRecipe(rawRecipe:RawRecipe) -> Recipe{
    // Convert a raw recipe into our internal recipe type
    return Recipe(
        id: rawRecipe.idMeal,
        name: rawRecipe.strMeal,
        category: rawRecipe.strCategory,
        area: rawRecipe.strArea,
        instructions: rawRecipe.strInstructions,
        thumbnailURL: rawRecipe.strMealThumb,
        youtubeUrl: rawRecipe.strYoutube,
        ingredients: ExtractIngredients(rawRecipe:rawRecipe),
        source: rawRecipe.strSource ?? "")
}

private func ExtractIngredients(rawRecipe:RawRecipe) -> [Ingredient]
{
        // Convert the ingredients and their respective measurements into a more
        // useful array of Ingredient structures.
        // Note: It is important that the array lists the ingredients in the
        // same order as in the raw recipe, as recipes traditionally order
        // the ingredient list in the order they are used
    var ingredients: [Ingredient] = []
        // This is ugly, but Swift doesn't appear to have a way for us to
        // iterate over strIngredient1, strIngredient2, etc
        // So, we're stuck adding each ingredient individually :'(
    AddIngredient(quantity:rawRecipe.strMeasure1,ingredient:rawRecipe.strIngredient1,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure2,ingredient:rawRecipe.strIngredient2,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure3,ingredient:rawRecipe.strIngredient3,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure4,ingredient:rawRecipe.strIngredient4,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure5,ingredient:rawRecipe.strIngredient5,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure6,ingredient:rawRecipe.strIngredient6,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure7,ingredient:rawRecipe.strIngredient7,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure8,ingredient:rawRecipe.strIngredient8,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure9,ingredient:rawRecipe.strIngredient9,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure10,ingredient:rawRecipe.strIngredient10,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure11,ingredient:rawRecipe.strIngredient11,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure12,ingredient:rawRecipe.strIngredient12,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure13,ingredient:rawRecipe.strIngredient13,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure14,ingredient:rawRecipe.strIngredient14,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure15,ingredient:rawRecipe.strIngredient15,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure16,ingredient:rawRecipe.strIngredient16,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure17,ingredient:rawRecipe.strIngredient17,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure18,ingredient:rawRecipe.strIngredient18,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure19,ingredient:rawRecipe.strIngredient19,ingredients:&ingredients)
    AddIngredient(quantity:rawRecipe.strMeasure20,ingredient:rawRecipe.strIngredient20,ingredients:&ingredients)
    
    return ingredients
}

private func AddIngredient(quantity:String?,ingredient:String?, ingredients:inout [Ingredient]) -> Void
{
    if let quantity, let ingredient{
        if !quantity.isEmpty && !ingredient.isEmpty{
            ingredients.append(Ingredient(quantity:quantity,ingredient:ingredient))
        }
    }
}

// Structures representing the raw output of the meal database's lookup API.
// These should only be used to retrieve the recipe data and then convert it
// to an instance of our internal Recipe model. Let's keep them here so your
// regular everyday normal dev does not need to care about them!

struct RawRecipes: Codable{
    var meals: [RawRecipe]
}
struct RawRecipe: Codable{
    var idMeal: String
    var strMeal: String
    var strDrinkAlternate: String?
    var strCategory: String
    var strArea: String
    var strInstructions: String
    var strMealThumb: String
    var strTags: String?
    var strYoutube: String
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?
    var strSource: String?
    var strImageSource: String?
    var strCreativeCommonsConfirmed: String?
    var dateModified: String?
}
