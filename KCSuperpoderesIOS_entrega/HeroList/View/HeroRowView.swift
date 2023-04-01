//
//  HeroRowView.swift
//  KCSuperpoderesIOS_entrega
//
//  Created by Camila Laura Lopez on 1/4/23.
//

import SwiftUI

struct HeroRowView: View {
    
    var hero: Hero
    
    var body: some View {
       
        VStack{
            AsyncImage(url: URL(string: "\(hero.thumbnail.path).\(hero.thumbnail.thumbnailExtension)")){
                Image in
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 20)
                    .opacity(0.88)
            }placeholder:{
                Text("Cargando..")
                    .bold()
                    .foregroundColor(.blue)
                    .opacity(0.6)
                    .font(.subheadline)
                    .padding([.leading, .trailing], 20)
                    .padding([.bottom, .top], 10)
            }
            
            Text("\(hero.name)")
                .font(.title)
                .foregroundColor(.gray)
                .bold()
        }
    }
}

struct HeroRowView_Previews: PreviewProvider {
    static var previews: some View {
        HeroRowView(hero: Hero(id: 001, name: "Capitan America", description: "Lorem lorem", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: ".jpg")))
    }
}
