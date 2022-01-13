//
//  HeroesViewModel.swift
//  kcMarvelApp
//
//  Created by Ramón Menor Molina on 13/1/22.
//

import Foundation
import Combine

class HeroesListViewModel: ObservableObject {
    @Published var welcome: Welcome?
    @Published var status = Status.loaded
    
    var suscriptors = Set<AnyCancellable>()
    
    init() {
        getHeroes()
    }
    
    func getHeroes() {
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getHeroes())
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                          throw URLError(.badServerResponse)
                      }
                // Devolvemos el json
                return $0.data
            }
            .decode(type: Welcome.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink {
                completion in
                switch completion {
                case .failure:
                    self.status = Status.error(error: "Error al buscar los héroes")
                case .finished:
                    self.status = Status.loaded
                }
            } receiveValue: { Welcome in
                self.welcome = Welcome
            }
            .store(in: &suscriptors)
    }
}
