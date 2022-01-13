//
//  StatusModel.swift
//  kcMarvelApp
//
//  Created by Ramón Menor Molina on 13/1/22.
//

import Foundation

enum Status {
    case none, loading, loaded, error(error:String)
}
