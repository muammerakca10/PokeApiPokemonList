//
//  Networking.swift
//  AnalyticaHouseTaskMA
//
//  Created by Muammer on 25.03.2023.
//

import Foundation


struct Networking {
    
    static let shared = Networking() //Singleton Pattern
    
    private let baseUrl = "https://pokeapi.co/api/v2/pokemon"
    
    func fetchData<T: Decodable>(endPointType: EndpointType,completion: @escaping (Result<T, Error>) -> Void) {  
        let request = URLRequest(url: URL(string: (baseUrl + endPointType.endPointValue))!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "response_error", code: 0, userInfo: nil)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "data_error", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

enum EndpointType {
    case allPokemons
    case singlePokemon(id : Int)
    
    private static let limit = 40
    
    var endPointValue : String {
        switch self {
        case .allPokemons:
            return "?limit=\(EndpointType.limit)"
        case .singlePokemon(let id):
            return "/\(id)/"
        }
    }
}
