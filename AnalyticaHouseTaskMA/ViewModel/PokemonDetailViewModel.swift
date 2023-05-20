//
//  PokemonDetailViewModel.swift
//  AnalyticaHouseTaskMA
//
//  Created by Muammer on 26.03.2023.
//

import Foundation

protocol PokemonDetailViewModelProtocol {
    
    var pokemonDetail : PokemonDetail {get set}
    
    var delegate: PokemonDetailViewModelDelegate? { get set }
    
    func didLoadView()
    
}

protocol PokemonDetailViewModelDelegate : AnyObject {
    func updateDataSource()
}

class PokemonDetailViewModel: PokemonDetailViewModelProtocol {
    
    var pokemonDetail: PokemonDetail = PokemonDetail()
    
    weak var delegate: PokemonDetailViewModelDelegate?
    
    func didLoadView() {
        guard let id = pokemonDetail.id else {return}
        Networking.shared.fetchData(endPointType: .singlePokemon(id : id), completion: didHandlePokemonDetailResponse(result:))
    }
    
    func didHandlePokemonDetailResponse(result : Result<PokemonDetail?,Error>){
        
        switch result {
        case .success(let response):
            guard let pokemonDetailResponse = response else{return}
            //print(pokemonDetailResponse)
            self.pokemonDetail = pokemonDetailResponse
            //print("self detail \(self.pokemonDetail)")
            self.delegate?.updateDataSource()
        case .failure(let error):
            print(error)
        }
    }
}

