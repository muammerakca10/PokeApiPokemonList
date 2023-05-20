//
//  UICollectionView+Extensions.swift
//  AnalyticaHouseTaskMA
//
//  Created by Muammer on 26.03.2023.
//

import UIKit

extension UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self.self)
    }
    
    func addBorder(width : CGFloat, color: UIColor){
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}
