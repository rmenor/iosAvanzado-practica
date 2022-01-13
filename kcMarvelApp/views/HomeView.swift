//
//  HomeView.swift
//  kcMarvelApp
//
//  Created by Ramón Menor Molina on 13/1/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var homeViewModel : HomeViewModel
    
    var body: some View {
        VStack {
            Text("KC. Marvel App")
            HeroesListView(viewModel: HeroesListViewModel())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
