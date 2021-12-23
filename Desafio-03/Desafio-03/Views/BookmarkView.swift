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
    
    var body: some View {
        
        NavigationView {
            if bookmarkedDrinks.grid {
                gridFormat(drinks: bookmarkedDrinks.drinks)
                    .navigationTitle("1: \(String(bookmarkedDrinks.grid))")
                    .toolbar {
                            Button {
                                bookmarkedDrinks.grid = !bookmarkedDrinks.grid
                            } label: { Image(systemName: "rectangle.grid.1x2") }
                    }
                
            } else {
                listFormat(drinks: bookmarkedDrinks.drinks)
                    .navigationTitle("2: \(String(bookmarkedDrinks.grid))")
                    
                    .toolbar {
                            Button {
                                bookmarkedDrinks.grid = !bookmarkedDrinks.grid
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
