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
    
    init(){
        getHeros()
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
}
