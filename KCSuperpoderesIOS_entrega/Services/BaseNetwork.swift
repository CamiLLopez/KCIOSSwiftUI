//
//  BaseNetwork.swift
//  KCSuperpoderesIOS_entrega
//
//  Created by Camila Laura Lopez on 31/3/23.
//

import Foundation


let server = "https://gateway.marvel.com"
let apiKey = "97057c98fd5e4ae4b4a114cbdcfb170a"
let ts = 1
let hash = "2c853d14267c2faa1b5546749905dae2"


struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}

enum endponints: String {
    case heroes = "/v1/public/characters"
    case series = "/v1/public/characters/characterID/series"
}

enum parametres: String {
    
    case apiKey = "apikey=97057c98fd5e4ae4b4a114cbdcfb170a"
    case ts = "ts=1"
    case hash = "hash=2c853d14267c2faa1b5546749905dae2"
}

struct BaseNetWork {
    
    func getHeroesList() ->  URLRequest{
        
        let url: String = "\(server)\(endponints.heroes.rawValue)?\(parametres.apiKey.rawValue)&\(parametres.ts.rawValue)&\(parametres.hash.rawValue)"
        var request : URLRequest = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
    
    func getSeriesByHero(characterID: Int) -> URLRequest {
        
        let endpointComplete: String = endponints.series.rawValue.replacingOccurrences(of: "characterID", with: String(characterID))
        let url: String = "\(server)\(endpointComplete)?\(parametres.apiKey.rawValue)&\(parametres.ts.rawValue)&\(parametres.hash.rawValue)"
        var request : URLRequest = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethods.get

        return request
    }
}
