//
//  HeroModel.swift
//  KCSuperpoderesIOS_entrega
//
//  Created by Camila Laura Lopez on 31/3/23.
//

import Foundation


struct MarvelResponse: Decodable {
    
    let data: HeroesResponse
}

struct HeroesResponse: Decodable {
    
    let results: [Hero]
    
}

struct Hero: Decodable, Identifiable {
    
    let id: Int
    let name, description: String
    let thumbnail: Thumbnail
}
