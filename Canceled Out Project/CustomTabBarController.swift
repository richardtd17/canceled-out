//
//  ViewController.swift
//  Canceled Out Project
//
//  Created by Richard Duong on 10/3/23.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Adjust the position of tab bar icons
        if let tabBarItems = tabBar.items {
            for item in tabBarItems {
                item.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
            }
        }
    }
}


