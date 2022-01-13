//
//  BaseNetwork.swift
//  kcMarvelApp
//
//  Created by Ramón Menor Molina on 13/1/22.
//

import Foundation

let server = "https://gateway.marvel.com"
let apiKey = "c867dd93ed24e4d3b27244b0f0519d54" // Api key de Marvel
let ts = "1"
let hash = "19a63277c63732e1e1bc709ff9f1014c" // Hash calculado md5(ts+privateKey+publicKey)

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let content = "application/json"
}

enum endpoints :String {
    case characters = "/v1/public/characters"
}

struct BaseNetwork {
    // Lista de héroes
    func getHeroes() -> URLRequest {
        let urlCad :String = "\(server)\(endpoints.characters.rawValue)?apikey=\(apiKey)&ts=\(ts)&hash=\(hash)&orderBy=-modified"

        // Creamos la request
        var request :URLRequest = URLRequest(url: URL(string: urlCad)!) // se debería desempaquetar
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        
        return request
    }
    
    // Lista de series
    func getSeriesHeroe(id:Int) -> URLRequest {
        let urlCad :String = "\(server)\(endpoints.characters.rawValue)/\(id)/series?apikey=\(apiKey)&ts=\(ts)&hash=\(hash)&orderBy=-modified"
        
        // Creamos la request
        var request :URLRequest = URLRequest(url: URL(string: urlCad)!) // se debería desempaquetar
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        
        return request
    }
}
