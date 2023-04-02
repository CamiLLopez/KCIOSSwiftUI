//
//  ViewModelHeroList.swift
//  KCSuperpoderesIOS_entrega
//
//  Created by Camila Laura Lopez on 1/4/23.
//

import Foundation
import Combine


final class ViewModelHeroList: ObservableObject {
    
    @Published var heros: [Hero]?
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()
    
    init(testingMode: Bool = false){
        if(testingMode){
            getHerosTesting()
        }else{
            getHeros()
        }
    }
    
    func getHeros(){
        
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetWork().getHeroesList())
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: MarvelResponse.self, decoder: JSONDecoder())
            .map{ heroesResponse in
                return heroesResponse.data.results
            }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure:
                    self.status = Status.error(error: "Error al obtener heroes de API")
                case .finished:
                    self.status = .ready
                }
            } receiveValue: { data in
                self.heros = data
            }
            .store(in: &suscriptors)
    }
    
    func getHerosTesting(){
        
        let hero = Hero(id: 1011334, name: "3-D Man", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: ".jpg"))
        let hero1 = Hero(id: 1017100, name: "A.I.M.", description: "AIM is a terrorist organization bent on destroying the world.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec", thumbnailExtension: ".jpg"))
        let hero2 = Hero(id: 1010699, name: "Aaron Stack", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: ".jpg"))
        let hero3 = Hero(id: 1009146, name: "Abomination (Emil Blonsky)", description: "Formerly known as Emil Blonsky, a spy of Soviet Yugoslavian origin working for the KGB, the Abomination gained his powers after receiving a dose of gamma radiation similar to that which transformed Bruce Banner into the incredible Hulk.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04", thumbnailExtension: ".jpg"))
        
        self.heros = [hero, hero1, hero2, hero3]
    }
}
