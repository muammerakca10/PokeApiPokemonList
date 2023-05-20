//
//  PokemonDetailViewController.swift
//  AnalyticaHouseTaskMA
//
//  Created by Muammer on 26.03.2023.
//

import UIKit

final class PokemonDetailViewController: BaseViewController {
    
    var stackView = UIStackView()
    var imageView = UIImageView()
    var nameLabel = UILabel()
    var abilitiesLabel = UILabel()
    
    private var viewModel : PokemonDetailViewModelProtocol
    
    init(viewModel : PokemonDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.didLoadView()
        
        setupStackView()
        setupImageView()
        setupNameLabel()
        setupAbilitiesLabel()
        addSubViewsToView()
        setStackViewAnchors()
    }
    
    func setupStackView(){
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
    }
    
    func setupImageView(){
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupNameLabel(){
        nameLabel.font = UIFont.boldSystemFont(ofSize: 32)
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .black
        nameLabel.textColor = .white
    }
    
    func setupAbilitiesLabel(){
        abilitiesLabel.text = "ABILITIES:"
        abilitiesLabel.font = UIFont.systemFont(ofSize: 20)
        abilitiesLabel.textAlignment = .center
        abilitiesLabel.numberOfLines = 0
    }
    
    func addSubViewsToView(){
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(abilitiesLabel)
        view.addSubview(stackView)
    }
    
    func setStackViewAnchors(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
            imageView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
        ])
    }
}

extension PokemonDetailViewController : PokemonDetailViewModelDelegate{
    func updateDataSource(){
        DispatchQueue.main.async {
            self.nameLabel.text = self.viewModel.pokemonDetail.name?.uppercased()
            guard let sprites = self.viewModel.pokemonDetail.sprites else {return}
            self.imageView.setImage(with: URL(string: sprites.frontDefault))
            
            guard let abilities = self.viewModel.pokemonDetail.abilities else {return}
            
            for ability in abilities {
                self.abilitiesLabel.text! += "\n*\(ability.ability!.name!.capitalized)"
            }
        }
    }
}
