//
//  ViewController.swift
//  AnalyticaHouseTaskMA
//
//  Created by Muammer on 25.03.2023.
//

import UIKit

final class SplashViewController: UIViewController {
    
    var pokemons = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Networking.shared.fetchData (endPointType: .allPokemons ) { (result: Result<PokemonList,Error>) in
            switch result {
            case .success(let response):
                
                DispatchQueue.main.async {
                    let pokemonsView = PokemonsViewController(pokemons: response.results ?? [])
                    self.navigationController?.pushViewController(pokemonsView, animated: true)
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    let ac = UIAlertController(title: "Network Error",
                                               message: "Please check your internet connection and try again.",
                                               preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default){alert in
                        exit(0)
                    })
                    self.present(ac, animated: true, completion: nil)
                }
                print(" ERROR!!!!!! \(error)")
            }
        }
    }
}

