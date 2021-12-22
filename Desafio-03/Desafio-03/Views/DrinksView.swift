//
//  ContentView.swift
//  Desafio-03
//
//  Created by MARCOS FELIPE SOARES ROCHA on 22/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DrinksView: View {
    
    @StateObject var viewModel: DrinksViewModel
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    fileprivate func gridFormat() -> some View {
        return ScrollView {
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(self.viewModel.drinks, id: \.self) { drink in
                    VStack(alignment: .center) {
                        WebImage(url: URL(string: drink.drinkThumb))
                            .resizable()
                            .placeholder {
                                Rectangle().foregroundColor(.gray)
                            }
                            .indicator(.activity)
                            .scaledToFit()
                            .cornerRadius(4)
                            .frame(width: 70)
                        Text(drink.drink)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                    }
                }
            }
        }
    }
    
    
    fileprivate func listFormat2() -> some View {
        return ScrollView {
            LazyVGrid(columns: [GridItem(.flexible())], alignment: .leading) {
                ForEach(self.viewModel.drinks, id: \.self) { drink in
                    HStack() {
                        WebImage(url: URL(string: drink.drinkThumb))
                            .resizable()
                            .placeholder {
                                Rectangle().foregroundColor(.gray)
                            }
                            .indicator(.activity)
                            .scaledToFit()
                            .cornerRadius(4)
                            .frame(width: 70)
                        Text(drink.drink)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                    }
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                }
            }
        }
    }
    
    fileprivate func listFormat() -> some View {
        return List(self.viewModel.drinks) { drink in
            HStack {
                WebImage(url: URL(string: drink.drinkThumb))
                    .resizable()
                    .placeholder {
                        Rectangle().foregroundColor(.gray)
                    }
                    .indicator(.activity)
                    .scaledToFit()
                    .cornerRadius(4)
                    .frame(width: 70)
                VStack(alignment: .leading) {
                    Text(drink.drink)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                }
            }
        }
    }
    
    var body: some View {
        
        NavigationView {
            if self.viewModel.grid {
                gridFormat()
                    .navigationTitle("VaiVira")
                    .toolbar {
                        Button {
                            self.viewModel.grid = false
                        } label: {
                            Image(systemName: "list.bullet")
                        }
                    }
            } else {
                listFormat()
                    .navigationTitle("VaiVira")
                    .toolbar {
                        Button {
                            self.viewModel.grid = true
                        } label: {
                            Image(systemName: "square.grid.2x2")
                        }
                    }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrinksView(viewModel: DrinksViewModel())
    }
}
