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

func gridFormat(drinks: [Drink]) -> some View {
    return ScrollView {
        LazyVGrid(columns: columns, alignment: .center) {
            ForEach(drinks, id: \.self) { drink in
                Link(destination: drink.getURL()) {
                    VStack(alignment: .center) {
                        WebImage(url: URL(string: drink.drinkThumb))
                            .resizable()
                            .placeholder {
                                Rectangle().foregroundColor(.gray)
                            }
                            .indicator(.activity)
                            .scaledToFit()
                            .cornerRadius(10)
                            .frame(width: 100)
                            .shadow(color: Color.gray, radius: 25)
                        Text(drink.drink)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                    }
                }
            }
        }
    }
}
