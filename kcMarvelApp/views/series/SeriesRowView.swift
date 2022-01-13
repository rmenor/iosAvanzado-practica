//
//  SeriesRowView.swift
//  kcMarvelApp
//
//  Created by Ramón Menor Molina on 13/1/22.
//

import SwiftUI

struct SeriesRowView: View {
    @ObservedObject private var photoViewModel = PhotoViewModel()
    
    var serie: Result
    
    var body: some View {
        VStack {
            // Si hay foto
            if let photo = photoViewModel.photo {
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
            
            Text("\(serie.title!)")
                .font(.title)
                .foregroundColor(.gray)
            
            if let description = serie.description {
                Text("\(description)")
                    .foregroundColor(.gray)
                    .font(.body)
                }
        }
        .onAppear {
            photoViewModel.loadImage(url: self.serie.thumbnail.path+"/portrait_xlarge.jpg")
        }
    }
}

struct SeriesRowView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesRowView(serie: Result(id: 1011334, title: "3-D Man", name:"", description: "", thumbnail: Thumbnail(path:  "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg), resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334"))
    }
}
