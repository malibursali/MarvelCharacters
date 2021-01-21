//
//  SplashViewController.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import UIKit


class SplashViewController: BaseViewController {
    
    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showViewController(storyboard: StoryboardHelper.main.name)
        }
    }
    
    
    // MARK: - Setup
    
    override func setupComponents() {
        super.setupComponents()
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        self.hideNavigationBar()
    }

    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
}

