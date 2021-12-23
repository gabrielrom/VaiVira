//
//  GridView.swift
//  Desafio-03
//
//  Created by PEDRO GALDIANO DE CASTRO on 23/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

var columns = [
    GridItem(.flexible()),
    GridItem(.flexible())
]

func gridFormat(drinks: [Drink], favoriteDrinks: FetchedResults<FavoriteDrink>?) -> some View {
    favoriteDrinks?.forEach { print("DrinkId: \($0.drinkId) | DrinkName: \($0.drinkName) ")}
    return ScrollView {
        LazyVGrid(columns: columns, alignment: .center) {
            
//            if !favoriteDrinks?.isEmpty! {
//                favoriteDrinks?.forEach { value in
//                    NavigationLink(destination: DetailsView(
//                        drinkId: value.drinkId,
//                        isFavorited: true)
//                    ) {
//                        VStack(alignment: .center) {
//                            WebImage(url: URL(string: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg"))
//                                .resizable()
//                                .placeholder {
//                                    Rectangle().foregroundColor(.gray)
//                                }
//                                .indicator(.activity)
//                                .scaledToFit()
//                                .cornerRadius(35)
//                                .frame(width: 100)
//                                .shadow(color: Color.orange, radius: 9)
//
//                            Text(value.drinkName)
//                                .fontWeight(.semibold)
//                                .lineLimit(1)
//                        }
//                    }
//                }
//            } else {
//                ForEach(favoriteDrinks, id: \.drinkId) { drink in
//                    NavigationLink(destination: DetailsView(
//                        drinkId: drink.id,
//                        isFavorited: favoriteDrinks?.contains(where: { $0.drinkId == drink.id }) ?? false)
//                    ) {
//                        VStack(alignment: .center) {
//                            WebImage(url: URL(string: drink.drinkThumb))
//                                .resizable()
//                                .placeholder {
//                                    Rectangle().foregroundColor(.gray)
//                                }
//                                .indicator(.activity)
//                                .scaledToFit()
//                                .cornerRadius(35)
//                                .frame(width: 100)
//                                .shadow(color: Color.orange, radius: 9)
//
//                            Text(drink.drinkName ?? "Nao deu cerrto")
//                                .fontWeight(.semibold)
//                                .lineLimit(1)
//                        }
//                    }
//                }
//
//            }
            
            ForEach(drinks, id: \.id) { drink in
                NavigationLink(destination: DetailsView(
                    drinkId: drink.id,
                    isFavorited: favoriteDrinks?.contains(where: { $0.drinkId == drink.id }) ?? false)
                ) {
                    VStack(alignment: .center) {
                        WebImage(url: URL(string: drink.drinkThumb))
                            .resizable()
                            .placeholder {
                                Rectangle().foregroundColor(.gray)
                            }
                            .indicator(.activity)
                            .scaledToFit()
                            .cornerRadius(35)
                            .frame(width: 100)
                            .shadow(color: Color.orange, radius: 9)
                        
                        Text(drink.drink)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                    }
                }
            }
        }
    }
}
