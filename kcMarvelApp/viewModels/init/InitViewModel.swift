//
//  HomeViewModel.swift
//  kcMarvelApp
//
//  Created by Ramón Menor Molina on 13/1/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var status = Status.none
    
    func load() {
        self.status = .loading
    }
}
