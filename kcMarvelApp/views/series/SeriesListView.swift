//
//  SeriesListView.swift
//  kcMarvelApp
//
//  Created by Ramón Menor Molina on 13/1/22.
//

import SwiftUI

struct SeriesListView: View {
    @StateObject private var viewModel = SeriesListViewModel()
    
    var heroe: Result

    init(heroe:Result){
        self.heroe = heroe
    }

    var body: some View {
        switch viewModel.status {
        case Status.none:
            Group {
                Text("")
                let _ = viewModel.getSeriesHeroe(id: heroe.id) 
            }
        case .loading:
            CargandoView()
        case Status.loaded:
            List {
                if let results = viewModel.welcome?.data.results {
                    ForEach(results) { serie in
                        SeriesRowView(serie: serie)
                    }
                }
            }.navigationBarTitle("Series \(heroe.name!)")
        case Status.error(error: let errorString):
            Text("Error: \(errorString)")
                .foregroundColor(Color.red)
        }
    }
}

struct SeriesListView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesListView(heroe: Result(id: 1011334, title: "", name: "3-D Man", description: "", thumbnail: Thumbnail(path:  "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg), resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334"))
    }
}
