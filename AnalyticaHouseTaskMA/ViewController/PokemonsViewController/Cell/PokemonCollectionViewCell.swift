//
//  PokemonCollectionViewCell.swift
//  AnalyticaHouseTaskMA
//
//  Created by Muammer on 26.03.2023.
//

import UIKit
//import Kingfisher

final class PokemonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundForCell: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(with pokemon: Pokemon){
        imageView.setImage(with: URL(string: pokemon.imageUrl))
        nameLabel.text = pokemon.name?.uppercased()
        self.backgroundColor = .white
        self.addBorder(width: 2, color: .black)
    }
}
