//
//  ContentView.swift
//  Desafio-03
//
//  Created by MARCOS FELIPE SOARES ROCHA on 22/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct BookmarkView: View {
    
//    @StateObject var bookmarkedDrinks: BookmarkedDrinksViewModel
    @ObservedObject var bookmarkedDrinks: BookmarkedDrinksViewModel
    @FetchRequest(entity: FavoriteDrink.entity(), sortDescriptors: []) var entitiesFavorited: FetchedResults<FavoriteDrink>
    
    
    var body: some View {
        
        NavigationView {
            if self.bookmarkedDrinks.grid {
                
                var detailsView = [DrinkDetails]()
                entitiesFavorited.forEach { value in
                    detailsView.append(DrinkDetails())
                }
                
                bookmarkedGridViewFormat(drinks:)
                    .navigationTitle("Bookmarked Drinks")
                    .toolbar {
                            Button {
                                print(bookmarkedDrinks.drinks)
                                self.bookmarkedDrinks.grid = false
                            } label: { Image(systemName: "rectangle.grid.1x2") }
                    }
                
            }
//            else {
//                listFormat(drinks: bookmarkedDrinks.drinks)
//                    .navigationTitle("Bookmarked Drinks")
//
//                    .toolbar {
//                            Button {
//                                self.bookmarkedDrinks.grid = true
//                            } label: { Image(systemName: "square.grid.2x2") }
//                    }
//            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DrinksView(viewModel: DrinksViewModel())
//    }
//}
