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
        self.setNavigationBarColor()
        self.setTitleAttributes()
        self.setLargeTitleAttributes()
    }

    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    func hideNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func showNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func setNavigationBarColor() {
        self.navigationController?.navigationBar.barTintColor = UIColor.systemGray6
    }
    
    private func setTitleAttributes() {
        let titleAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: ColorHelper.hexFA2000.color
        ]
        
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
    }
    
    private func setLargeTitleAttributes() {
        let titleAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: ColorHelper.hexFA2000.color
        ]
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = titleAttributes
    }
    
    func showViewController(storyboard name: String, completion: ((_ viewController: UIViewController) -> Void)?) {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() else {
            return
        }
        
        completion?(viewController)
        
        self.navigationController?.show(viewController, sender: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(okButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showResponseError() {
        self.showAlert(title: "Error", message: "Something went wrong. Please try later.")
    }
    
    func showLoadingView() {
        let loadingView = LoadingView(frame: screenSize)
        loadingView.tag = 100
        root?.view.addSubview(loadingView)
        loadingView.startAnimation()
    }
    
    func hideLoadingView() {
        var loadingView = root?.view.viewWithTag(100) as? LoadingView
        loadingView?.removeFromSuperview()
        loadingView?.stopAnimation()
        loadingView = nil
    }
}

