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
    var bookmarkedDrinks: BookmarkedDrinksViewModel
    
    var favoritedDrinks: FetchedResults<FavoriteDrink>
    
    init(bookMarkedDrinks: BookmarkedDrinksViewModel, favoritedDrinks: FetchedResults<FavoriteDrink>) {
        self.favoritedDrinks = favoritedDrinks
        self.bookmarkedDrinks = bookMarkedDrinks
    }
    
    var body: some View {
        
        NavigationView {
            if self.bookmarkedDrinks.grid {
                gridFormat(drinks: self.bookmarkedDrinks.drinks, favoriteDrinks: favoritedDrinks)
                    .navigationTitle("1: \(String(self.bookmarkedDrinks.grid))")
                    .toolbar {
                            Button {
                                print(self.bookmarkedDrinks.grid)
                                self.bookmarkedDrinks.grid = false
                                print(self.bookmarkedDrinks.grid)
                                print("antes")

                            } label: { Image(systemName: "rectangle.grid.1x2") }
                    }
                
            } else {
                listFormat(drinks: bookmarkedDrinks.drinks)
                    .navigationTitle("2: \(String(self.bookmarkedDrinks.grid))")

                    .toolbar {
                            Button {

                                self.bookmarkedDrinks.grid = true
          
                                print("depois")
                            } label: { Image(systemName: "square.grid.2x2") }
                    }
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DrinksView(viewModel: DrinksViewModel())
//    }
//}
