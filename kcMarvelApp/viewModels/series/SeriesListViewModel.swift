//
//  SeriesListModel.swift
//  kcMarvelApp
//
//  Created by Ramón Menor Molina on 13/1/22.
//

import Foundation
import Combine

class SeriesListViewModel: ObservableObject {
    @Published var welcome: Welcome?
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()
    
    func getSeriesHeroe(id: Int) {
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSeriesHeroe(id: id))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                          self.status = Status.error(error: "Error Api de Marvel para las Series")
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
                    self.status = Status.error(error: "Error al buscar las series")
                case .finished:
                    self.status = Status.loaded
                }
            } receiveValue: { Welcome in
                self.welcome = Welcome
            }
            .store(in: &suscriptors)
    }
}
