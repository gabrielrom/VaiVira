//
//  ContentView.swift
//  Desafio-03
//
//  Created by MARCOS FELIPE SOARES ROCHA on 22/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

class ViewModelTeste: ObservableObject {
    @Published var grid:Bool = true
}

struct ContentView: View {
    
    @StateObject var viewModel: ViewModelTeste
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var items = [0, 1, 2, 4, 5, 6]
    
    fileprivate func gridFormat() -> some View {
        return ScrollView {
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(items, id: \.self) { _ in
                    VStack(alignment: .center) {
                        WebImage(url: URL(string: "https://www.thecocktaildb.com/images/media/drink/srpxxp1441209622.jpg"))
                            .resizable()
                            .placeholder {
                                Rectangle().foregroundColor(.gray)
                            }
                            .indicator(.activity)
                            .scaledToFit()
                            .cornerRadius(4)
                            .frame(width: 70)
                        Text("Nome")
                            .fontWeight(.semibold)
                            .lineLimit(1)
                    }
                }
            }
        }
    }
    
    fileprivate func listFromat() -> some View {
        return List(0..<items.count) { _ in
            HStack {
                WebImage(url: URL(string: "https://www.thecocktaildb.com/images/media/drink/srpxxp1441209622.jpg"))
                    .resizable()
                    .placeholder {
                        Rectangle().foregroundColor(.gray)
                    }
                    .indicator(.activity)
                    .scaledToFit()
                    .cornerRadius(4)
                    .frame(width: 70)
                VStack(alignment: .leading) {
                    Text("Nome: ")
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
                    .navigationTitle("ZéDoDrink")
                    .toolbar {
                        Button {
                            self.viewModel.grid = false
                        } label: {
                            Image(systemName: "square.grid.2x2")
                        }
                    }
            } else {
                listFromat()
                    .navigationTitle("ZéDoDrink")
                    .toolbar {
                        Button {
                            self.viewModel.grid = true
                        } label: {
                            Image(systemName: "list.bullet")
                        }
                    }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModelTeste())
    }
}
