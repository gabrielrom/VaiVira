//
//  DetailsView.swift
//  Desafio-03
//
//  Created by PEDRO GALDIANO DE CASTRO on 23/12/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct DetailsView: View {
    var drinkDetailsViewModel: DrinkDetailsViewModel
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    let drinkId: String
    let isFavorited: Bool
    
    init(drinkId: String, isFavorited: Bool = false) {
        self.drinkId = drinkId
        self.isFavorited = isFavorited
        self.drinkDetailsViewModel = DrinkDetailsViewModel(drinkId: drinkId)
    }

    var body: some View {
        VStack {
            WebImage(url: URL(string: drinkDetailsViewModel.drinkDetails!.thumb))
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .indicator(.activity)
                .scaledToFit()
                .cornerRadius(35)
                .frame(width: 250)
                .shadow(color: Color.orange, radius: 100)
                .padding(.vertical, 30)
            
            
            HStack(alignment: .top, spacing: 100) {
                VStack(alignment: .center) {
                        Text("Category")
                        .bold()
                        .font(.title2)
                        .padding(.vertical, 0)
                    
                    Text(drinkDetailsViewModel.drinkDetails!.category)
                        .padding(.vertical, 1)
                }
                VStack(alignment: .center) {
                    Text("Type")
                        .bold()
                        .font(.title2)
                        .padding(.vertical, 0)

                    Text(drinkDetailsViewModel.drinkDetails!.isAlcoholic)
                        .padding(.vertical, 1)
                }
            }
            
//            Divider()
            
            HStack(alignment: . center, spacing: 100) {
                Text("Ingredient")
                    .bold()
                    .font(.title2)
                    .padding(.vertical, 20)
                
                Text("Quantity")
                    .bold()
                    .font(.title2)
                    .padding(.vertical, 20)
            }
    
            Divider()
            Spacer()
            
            ScrollView {
                ForEach(drinkDetailsViewModel.drinkDetails!.ingredients, id: \.id) { ingredient in
                    
                    HStack(alignment: .top, spacing: 100) {
                        Text(ingredient.name)
                                .bold()
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                .lineLimit(4)
                                .minimumScaleFactor(0.8)
                                
                                .padding(.top, 3)
                                .frame(width: 100)

                        Text(ingredient.measure)
                                .bold()
                                .font(.callout)
                                .multilineTextAlignment(.center)
                                .lineLimit(4)
                                .minimumScaleFactor(0.8)
                                .padding(.top, 3)
                                .frame(width: 100)
                        }
                    }
                }
            }.padding(30)
            

            .navigationTitle(drinkDetailsViewModel.drinkDetails!.drinkName)
            .toolbar {
                if isFavorited {
                    Button {
                        
                    } label : {
                        Image(systemName: "star.fill")
                    }
                } else {
                    Button {
                        let favoriteDrink = FavoriteDrink(context: managedObjectContext)
                        var ingredients = [IngredientsDrink]()
                        
                        for ingredient in drinkDetailsViewModel.drinkDetails!.ingredients {
                            let ingredientEntity = IngredientsDrink(context: managedObjectContext)
                            
                            ingredientEntity.name = ingredient.name
                            
                            ingredients.append(ingredientEntity)
                        }
                        
                        
                        favoriteDrink.drinkId = drinkDetailsViewModel.drinkDetails!.id
                        favoriteDrink.drinkName = drinkDetailsViewModel.drinkDetails!.drinkName
                        favoriteDrink.isAlcoholic = drinkDetailsViewModel.drinkDetails!.isAlcoholic
                        favoriteDrink.ingredients = NSSet(array: ingredients)
                        
                        PersistenceController.shared.save()
                    } label : {
                        Image(systemName: "star")
                    }
                }
            }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(drinkId: "11078", isFavorited: false)
    }
}
