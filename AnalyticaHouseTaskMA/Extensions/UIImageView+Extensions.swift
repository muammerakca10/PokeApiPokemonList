//
//  UIImageView+Extensions.swift
//  AnalyticaHouseTaskMA
//
//  Created by Muammer on 26.03.2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with url: URL?) {
        self.kf.setImage(with: url)
    }
}
