//
//  HeroesRowView.swift
//  kcMarvelApp
//
//  Created by Ramón Menor Molina on 13/1/22.
//

import SwiftUI

struct HeroesRowView: View {
    @ObservedObject private var viewModel = PhotoViewModel()
    
    var heroe: Result
    
    init(heroe:Result){
        self.heroe = heroe
    }
    
    var body: some View {
        VStack {
            // Si hay foto
            if let photo = viewModel.photo {
                photo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 20)
                    .opacity(0.8)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 20)
                    .opacity(0.6)
            }
            
            Text("\(heroe.name!)")
                .font(.title)
                .foregroundColor(.gray)
        }
        .onAppear {
            viewModel.loadImage(url: self.heroe.thumbnail.path+"/landscape_xlarge.jpg")
        }
    }
}

struct HeroesRowView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesRowView(heroe: Result(id: 1011334, title: "", name: "3-D Man", description: "", thumbnail: Thumbnail(path:  "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg), resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334"))
    }
}
