//
//  UICollectionView+Extensions.swift
//  AnalyticaHouseTaskMA
//
//  Created by Muammer on 26.03.2023.
//

import UIKit

extension UICollectionView {
    
    func register(cell: UICollectionViewCell.Type) {
        let bundle = Bundle(for: cell.self)
        let nib = UINib(nibName: cell.identifier, bundle: bundle)
        self.register(nib, forCellWithReuseIdentifier: cell.identifier)
    }
}
