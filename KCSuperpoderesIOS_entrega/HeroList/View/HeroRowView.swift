//
//  HeroRowView.swift
//  KCSuperpoderesIOS_entrega
//
//  Created by Camila Laura Lopez on 1/4/23.
//

import SwiftUI

struct HeroRowView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var hero: Hero
    
    var body: some View {
        
        VStack{
            if colorScheme == .light {
                AsyncImage(url: URL(string: "\(hero.thumbnail.path).\(hero.thumbnail.thumbnailExtension)")){
                    Image in
                    Image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        .padding([.leading, .trailing], 15)
                        .opacity(0.88)
                }placeholder:{
                    SpinnerView()
                }
                .id(0)
                
                Text("\(hero.name)")
                    .font(.title2)
                    .foregroundColor(.black)
                    .opacity(0.7)
                    .bold()
                    .id(1)
                
            }else{
                AsyncImage(url: URL(string: "\(hero.thumbnail.path).\(hero.thumbnail.thumbnailExtension)")){
                    Image in
                    Image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        .padding([.leading, .trailing], 15)
                        .opacity(0.9)
                }placeholder:{
                    SpinnerView()
                }
                .id(0)
                
                Text("\(hero.name)")
                    .font(.title2)
                    .foregroundColor(.white)
                    .bold()
                    .id(1)
            }
        }
    }
}

struct HeroRowView_Previews: PreviewProvider {
    static var previews: some View {
        HeroRowView(hero: Hero(id: 001, name: "Capitan America", description: "Lorem lorem", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: ".jpg")))
    }
}
