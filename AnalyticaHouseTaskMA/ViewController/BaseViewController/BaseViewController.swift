//
//  BaseViewController.swift
//  AnalyticaHouseTaskMA
//
//  Created by Muammer on 26.03.2023.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        self.navigationItem.titleView = UIImageView(image: ImagePalette.analyticaImage)
        self.navigationItem.titleView?.contentMode = .scaleAspectFit
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
        navigationItem.backBarButtonItem?.tintColor = .black
    }
}
