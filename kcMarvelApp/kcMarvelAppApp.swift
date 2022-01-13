//
//  kcMarvelAppApp.swift
//  kcMarvelApp
//
//  Created by Ramón Menor Molina on 12/1/22.
//

import SwiftUI

@main
struct kcMarvelAppApp: App {
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(homeViewModel)
        }
    }
}
