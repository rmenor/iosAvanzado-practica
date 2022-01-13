//
//  PhotoViewModel.swift
//  kcMarvelApp
//
//  Created by Ramón Menor Molina on 13/1/22.
//

import Foundation
import Combine
import SwiftUI

class PhotoViewModel: ObservableObject {
    @Published var photo:Image?
    
    var suscriptors = Set<AnyCancellable>()
    
    func loadImage(url:String) {
        let urlDownload = URL(string: url)!
        
        URLSession.shared
            .dataTaskPublisher(for: urlDownload)
            .map {
                response -> UIImage? in
                UIImage(data: response.data)
            }
            .map {
                image -> Image in
                Image(uiImage: image!)
            }
            .replaceError(with: Image(systemName: "person.fill"))
            .replaceNil(with: Image(systemName: "person.fill"))
            .receive(on: DispatchQueue.main)
            .sink {
                image in
                self.photo = image // $0
            }
            .store(in: &suscriptors)
    }
}
