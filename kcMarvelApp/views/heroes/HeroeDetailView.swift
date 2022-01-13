//
//  HeroeDetailView.swift
//  kcMarvelApp
//
//  Created by Ramón Menor Molina on 13/1/22.
//

import SwiftUI

struct HeroeDetailView: View {
    @ObservedObject private var viewModel = PhotoViewModel()
    
    var heroe: Result
    
    init(heroe:Result){
        self.heroe = heroe
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                if let photo = viewModel.photo {
                    photo
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 20)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 20)
                }
                
                HStack {
                    Text("\(self.heroe.name!)")
                        .font(.title)
                        .foregroundColor(.blue)
                }

                Spacer()
                
                Text("\(heroe.description!)")
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding()
            }
            .onAppear {
                if let _ = viewModel.photo{
                    return
                } else {
                    viewModel.loadImage(url: self.heroe.thumbnail.path+"/landscape_xlarge.jpg")
                }
            }
        }
    }
}

struct HeroeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeroeDetailView(heroe: Result(id: 1011334, title:"", name: "3-D Man", description: "", thumbnail: Thumbnail(path:  "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg), resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334"))
    }
}
