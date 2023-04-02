//
//  ViewModelSerieDetail.swift
//  KCSuperpoderesIOS_entrega
//
//  Created by Camila Laura Lopez on 1/4/23.
//

import Foundation
import Combine


final class ViewModelSerieDetail: ObservableObject {
    
   @Published var series: [HeroSerie]?
   @Published var status = Status.none
   
   var suscriptors = Set<AnyCancellable>()
   var characterID: Int
    
    init(testingMode: Bool = false, characterID: Int){
        self.characterID = characterID
    
    if(testingMode){
        getSeriesByHeroeTesting()
    }else{
        getSeriesByHeroe()
    }
}
    
    func getSeriesByHeroe(){
        
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetWork().getSeriesByHero(characterID: self.characterID))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: MarvelSeriesResponse.self, decoder: JSONDecoder())
            .map{ seriesResponse in
                debugPrint(seriesResponse.data.results)
                return seriesResponse.data.results
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
                self.series = data
            }
            .store(in: &suscriptors)
    }
    
    func getSeriesByHeroeTesting(){
        
        let serie = HeroSerie(id: 1945, title: "Avengers: The Initiative (2007 - 2010)", description: "", rating: "T", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", thumbnailExtension: ".jpg"))
        let serie1 = HeroSerie(id: 2005, title: "Deadpool (1997 - 2002)", description: "Wade Wilson: Heartless Merc With a Mouth or...hero? Laugh, cry and applaud at full volume for the mind-bending adventures of Deadpool, exploring the psyche and crazed adventures of Marvel's most unstable personality!", rating: "T", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/7/03/5130f646465e3", thumbnailExtension: ".jpg"))
        let serie2 = HeroSerie(id: 2045, title: "Marvel Premiere (1972 - 1981)", description: "", rating: "T", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/4/40/5a98437953d4e", thumbnailExtension: ".jpg"))
        
            self.series = [serie, serie1, serie2]
    }
}
