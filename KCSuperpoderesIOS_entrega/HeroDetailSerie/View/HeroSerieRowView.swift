//
//  HeroSerieRowView.swift
//  KCSuperpoderesIOS_entrega
//
//  Created by Camila Laura Lopez on 1/4/23.
//

import SwiftUI

struct HeroSerieRowView: View {
    
    var serie: HeroSerie

    var body: some View {
        VStack{
            
            Text("\(serie.title)")
                .font(.title2)
                .foregroundColor(.black)
                .opacity(0.9)
                .padding(10)
                .bold()
                .id(0)

            AsyncImage(url: URL(string: "\(serie.thumbnail.path).\(serie.thumbnail.thumbnailExtension)")){
                Image in
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(5)
                    .padding([.leading, .trailing], 20)
                    .opacity(0.78)
                    .id(1)
            }placeholder:{
                SpinnerView()
            }
            Text("\(serie.description ?? "No description found for this serie")")
                .font(.title3)
                .padding([.leading, .trailing], 20)
                .foregroundColor(.gray)
                .bold()
                .id(2)
        }
        
    }
}

struct HeroSerieRowView_Previews: PreviewProvider {
    static var previews: some View {
        HeroSerieRowView(serie: HeroSerie(id: 1011334, title: "Avengers: The Initiative (2007 - 2010)", description: "Lorem Lorem Lorem", rating: "T",  thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", thumbnailExtension: ".jpg")))
    }
}
