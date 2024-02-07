//
//  ColorsDetailViewController.swift
//  RandomColor
//
//  Created by LUIS GONZALEZ on 07/02/24.
//

import UIKit

class ColorsDetailViewController: UITabBarController {
    
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? .systemBlue
    }
}
