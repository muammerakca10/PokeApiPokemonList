//
//  PokemonList.swift
//  AnalyticaHouseTaskMA
//
//  Created by Muammer on 25.03.2023.
//

struct PokemonList: Decodable {
    let results: [Pokemon]?
}

struct Pokemon: Decodable {
    let name: String?
    let url: String?
    
    var id : Int {
        guard let urlArray = url?.split(separator: "/") else {return 1}
        return Int(urlArray[urlArray.count - 1])!
    }
    
    var imageUrl : String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
    }
    // id and imageUrl are computed properties
}

struct PokemonDetail : Decodable {
    var abilities : [AbilityObject]?
    var name : String?
    var id : Int?
    var sprites : Sprites?
}

struct AbilityObject: Decodable {
    let ability: Ability?
}

struct Ability: Decodable {
    let name: String?
}

struct Sprites: Codable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"

    }
}

