//
//  HeroSerieModel.swift
//  KCSuperpoderesIOS_entrega
//
//  Created by Camila Laura Lopez on 31/3/23.
//

import Foundation


struct MarvelSeriesResponse: Decodable {
    
    let data: HeroesSerieResponse
}

struct HeroesSerieResponse: Decodable {
    
    let results: [HeroSerie]
    
}

struct HeroSerie: Decodable, Identifiable {

        let id: Int
        let title: String
        let description: String?
        let rating: String
        let thumbnail: Thumbnail
}

