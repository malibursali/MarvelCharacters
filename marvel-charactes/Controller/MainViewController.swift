//
//  MainViewController.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    // MARK: - Properties
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setViewControllers(TabBarHelper.allCases.map{ $0.viewController }, animated: true)
        self.tabBar.tintColor = ColorHelper.hexFA2000.color
    }
}
