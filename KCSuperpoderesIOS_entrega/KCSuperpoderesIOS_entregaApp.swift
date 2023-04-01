//
//  KCSuperpoderesIOS_entregaApp.swift
//  KCSuperpoderesIOS_entrega
//
//  Created by Camila Laura Lopez on 26/3/23.
//

import SwiftUI

@main
struct KCSuperpoderesIOS_entregaApp: App {
    
    var body: some Scene {
        WindowGroup {
            HeroListView(viewModel: ViewModelHeroList())
        }
    }
}
