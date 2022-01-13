//
//  HeroesListView.swift
//  kcMarvelApp
//
//  Created by Ramón Menor Molina on 13/1/22.
//

import SwiftUI

struct HeroesListView: View {
    @StateObject var viewModel : HeroesListViewModel
    
    var body: some View {
        NavigationView {
            List {
                if let results = viewModel.welcome?.data.results {
                    ForEach(results) { heroe in
                        NavigationLink(
                            destination:
                                SeriesListView(heroe: heroe),
                            label: {
                                HeroesRowView(heroe: heroe)
                            }
                        )
                    }
                }
            }.navigationBarTitle("Lista de héroes")
        }
    }
}

struct HeroesListView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesListView(viewModel: HeroesListViewModel())
    }
}
