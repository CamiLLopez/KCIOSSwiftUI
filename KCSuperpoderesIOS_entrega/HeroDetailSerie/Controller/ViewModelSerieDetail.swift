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
    
    init(characterID: Int){
        self.characterID = characterID
        getSeriesByHeroe()
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
}
