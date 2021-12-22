// Drink.swift

struct Drink: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case drink = "strDrink"
        case drinkThumb = "strDrinkThumb"
    }
    
    let id: String
    let drink: String
    let drinkThumb: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        drink = try values.decode(String.self, forKey: .drink)
        drinkThumb = try values.decode(String.self, forKey: .drinkThumb)
    }
}
