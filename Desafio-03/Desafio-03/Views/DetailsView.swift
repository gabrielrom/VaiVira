//
//  DetailsView.swift
//  Desafio-03
//
//  Created by PEDRO GALDIANO DE CASTRO on 23/12/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct DetailsView: View {
    
    // REMOVER
    @State var bookmarkedDrinks:[Drink] = []
    @State var drinksContainsDrink = true
    
    let ingredientes = ["Triple sec", "Lime juice", "Salt", "Tequila", "Triple sec", "Lime juice", "Salt", "Tequila", "Triple sec", "Lime juice", "Salt"]
    let quantidades = ["1 1/2 oz ", "1/2 f ","1 oz ", "-", "1 1/2 oz ", "1/2 oz ","1 oz ", "-", "1 1/2 oz ", "1/2 oz ","1 oz ", "-"]
    // É SÓ PRA SERVIR DE EXEMPLO
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg"))
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
                    
                    Text("Ordinário")
                        .padding(.vertical, 1)
                }
                VStack(alignment: .center) {
                    Text("Type")
                        .bold()
                        .font(.title2)
                        .padding(.vertical, 0)

                    Text("Alcoolico")
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
                ForEach(Array(zip(ingredientes, quantidades)), id: \.0) { line in
                    
                    HStack(alignment: .top, spacing: 100) {
                        Text(line.0)
                                .bold()
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                .lineLimit(4)
                                .minimumScaleFactor(0.8)
                                
                                .padding(.top, 3)
                                .frame(width: 100)

                        Text(line.1)
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
            

            
        .navigationTitle("Nome do drink")
            .toolbar {
                if drinksContainsDrink {
                    Button {
                        print("DESfavoritou")
                        drinksContainsDrink = false // REMOVEr DO ARRAY DE DRINKS favoritos
                        //                        bookmarkedDrinks.remove(at: bookmarkedDrinks.firstIndex(of: drink))
                    } label : {
                        Image(systemName: "star.fill")
                    }
                } else {
                    Button {
                        print("FAVoritou")
                        drinksContainsDrink = true // adicionar no ARRAY DE DRINKS favoritos
                        //                        bookmarkedDrinks.append(drink)
                    } label : {
                        Image(systemName: "star")
                    }
                }
            }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
