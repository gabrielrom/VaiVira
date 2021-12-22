//
//  Desafio_03App.swift
//  Desafio-03
//
//  Created by MARCOS FELIPE SOARES ROCHA on 22/12/21.
//

import SwiftUI

@main
struct Desafio_03App: App {
    var body: some Scene {
        WindowGroup {
            DrinksView(viewModel: DrinksViewModel())
        }
    }
}
