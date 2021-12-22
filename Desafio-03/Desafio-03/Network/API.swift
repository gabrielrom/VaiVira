// API.swift

protocol API {
    func getDrinks(completion: @escaping (DrinkResponse?) -> Void)
}
