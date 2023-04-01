//
//  HeroListView.swift
//  KCSuperpoderesIOS_entrega
//
//  Created by Camila Laura Lopez on 1/4/23.
//

import SwiftUI

struct HeroListView: View {
    
    @StateObject var viewModel: ViewModelHeroList
    var body: some View {

    NavigationStack{
             List{
             if let heros = viewModel.heros{
             ForEach(heros) { hero in
               NavigationLink{
                   
                   HeroSerieDetailView(viewModel: ViewModelSerieDetail(characterID: hero.id))
                   
                 } label: {
                 HeroRowView(hero: hero)
                }
              }
             }
          }
             .navigationTitle("Marvel Heroes")
             
        }
    }
}

struct HeroListView_Previews: PreviewProvider {
    static var previews: some View {
        HeroListView(viewModel: ViewModelHeroList())
    }
}
