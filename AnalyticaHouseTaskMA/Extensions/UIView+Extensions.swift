//
//  UIView+Extensions.swift
//  AnalyticaHouseTaskMA
//
//  Created by Muammer on 26.03.2023.
//

import UIKit
//Foundation was not importing. Because UIKit contains Foundation. But Foundation doesn't contains UIKit.

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
