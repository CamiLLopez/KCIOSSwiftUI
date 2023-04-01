//
//  HeroSerieDetailView.swift
//  KCSuperpoderesIOS_entrega
//
//  Created by Camila Laura Lopez on 1/4/23.
//

import SwiftUI

struct HeroSerieDetailView: View {
    
    @StateObject var viewModel: ViewModelSerieDetail
    
    var body: some View {
        ScrollView(.vertical){
            if let series = viewModel.series{
                ForEach(series) { serie in
                    
                    HeroSerieRowView(serie: serie)
                 }
             
            }
        }
    }
}

struct HeroSerieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeroSerieDetailView(viewModel: ViewModelSerieDetail(characterID: 1011334))
    }
}
