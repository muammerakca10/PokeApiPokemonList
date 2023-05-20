//
//  PokemonsViewModel.swift
//  AnalyticaHouseTaskMA
//
//  Created by Muammer on 26.03.2023.
//

//import Foundation
//import UIKit
//
//protocol PokemonListViewModelProtocol {
//    var pokemons : [Pokemon] {get set}
//
//    var delegate : PokemonListViewModelDelegate? {get set}
//
//    func didLoadView()
//}
//
//protocol PokemonListViewModelDelegate : AnyObject {
//    func updateDataSource()
//}
//
//class PokemonListViewModel : PokemonListViewModelProtocol {
//
//    var pokemons: [Pokemon] = [Pokemon]()
//    var delegate: PokemonListViewModelDelegate?
//
//    func didLoadView() {
//        Networking.shared.fetchData (endPointType: .allPokemons , completion: didHandlePokemonResponse(result:) )
//
//    }
//
//    func didHandlePokemonResponse (result : Result<PokemonList, Error>){
//        switch result {
//        case .success(let response):
//            self.pokemons = response.results ?? []
//            self.delegate?.updateDataSource()
//        case .failure(let error):
//            print(error)
//        }
//    }
//}
