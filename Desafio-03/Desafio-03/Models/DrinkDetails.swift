import Foundation

struct DrinkData: Decodable {
    let drinks: [DrinkDetails]
}

struct DrinkDetails: Decodable, Identifiable {
    let id: UUID = UUID()
    let drinkName: String
    let isAlcoholic: String
    let instructions: String
    let thumb: String
    let ingredients: [Ingredient]
    let category: String
}

extension DrinkDetails {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let ingredientsDictionary = try container.decode([String: String?].self)
        
        var index = 1
        var ingredients: [Ingredient] = []
        
        while let ingredient = ingredientsDictionary["strIngredient\(index)"] as? String,
              let measure = ingredientsDictionary["strMeasure\(index)"] ?? "-",
              !ingredient.isEmpty{
            
            ingredients.append(.init(
                name: ingredient,
                measure: measure)
            )
            
            index += 1
        }
        
        self.ingredients = ingredients
        self.drinkName = ingredientsDictionary["strDrink"] as? String ?? ""
        self.isAlcoholic = ingredientsDictionary["strAlcoholic"] as? String ?? ""
        self.instructions = ingredientsDictionary["strInstructions"] as? String ?? ""
        self.thumb = ingredientsDictionary["strDrinkThumb"] as? String ?? ""
        self.category = ingredientsDictionary["strCategory"] as? String ?? ""
    }
    
}
