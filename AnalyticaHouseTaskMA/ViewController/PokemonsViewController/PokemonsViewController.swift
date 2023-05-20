//
//  PokemonsViewController.swift
//  AnalyticaHouseTaskMA
//
//  Created by Muammer on 26.03.2023.
//

import UIKit

final class PokemonsViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var pokemons = [Pokemon]()
    
    init(pokemons: [Pokemon]) {
        super.init(nibName: nil, bundle: nil)
        self.pokemons = pokemons
    }
    
    required init(coder : NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(cell: PokemonCollectionViewCell.self)
    }
}

extension PokemonsViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier, for: indexPath) as? PokemonCollectionViewCell else {fatalError("Cell was not created")}
        
        cell.configureCell(with: pokemons[indexPath.item])
        cell.nameLabel.text = pokemons[indexPath.item].name?.capitalized
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let screenWidth = view.frame.width
//        let itemWidth = (screenWidth - 40) / 2
//        let itemHeight = itemWidth/2
        return CGSize(width: 160, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select")
        var viewModel: PokemonDetailViewModelProtocol = PokemonDetailViewModel()
        viewModel.pokemonDetail.id = pokemons[indexPath.item].id
        let pokemonDetail = PokemonDetailViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(pokemonDetail, animated: true)
    }
}

//extension PokemonsViewController : PokemonListViewModelDelegate {
//    func updateDataSource() {
//        DispatchQueue.main.async {
//            self.collectionView.reloadData()
//        }
//    }
//}
