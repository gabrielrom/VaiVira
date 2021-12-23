import Foundation

class DrinkDetailsViewModel: ObservableObject {
    @Published var drinkDetails: DrinkDetails?
    
    let apiService: API
    
    init(drinkId: String, apiService: API = CocktailAPI()) {
        self.apiService = apiService
        self.getDrinkDetails(drinkId: drinkId)
    }
    
    func getDrinkDetails(drinkId: String) {
        apiService.getDrinkDetails(drinkId: drinkId) { response in
            if let drinkDetails = response {
                self.drinkDetails = drinkDetails.drinks.first
            }
        }
    }
    
}
