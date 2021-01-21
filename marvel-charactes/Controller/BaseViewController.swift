//
//  BaseViewController.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import UIKit


class BaseViewController: UIViewController {
    
    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupNavigationBar()
    }
    
    
    // MARK: - Setup
    
    func setupComponents() {
        
    }
    
    func setupNavigationBar() {
        
    }

    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    func hideNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func showNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
    }

    func showViewController(storyboard name: String) {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() else {
            return
        }
        
        self.navigationController?.show(viewController, sender: nil)
    }
}

