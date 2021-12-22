//
//  ContentView.swift
//  Desafio-03
//
//  Created by MARCOS FELIPE SOARES ROCHA on 22/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    var body: some View {
        List(0..<20) { _ in
            HStack {
                AnimatedImage(url: URL(string: "https://www.thecocktaildb.com/images/media/drink/srpxxp1441209622.jpg"))
                Image("img_placeholder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                VStack {
                    Text("Iron Man")
                    Text("123123")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
