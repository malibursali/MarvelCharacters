//
//  TabBarHelper.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import UIKit

enum TabBarHelper: Int, CaseIterable {
    case search
    case favorite
    
    var item: UITabBarItem.SystemItem {
        switch self {
        case .search:
            return .search
        case .favorite:
            return .favorites
        }
    }
    
    var tabBarItem: UITabBarItem {
        return UITabBarItem(tabBarSystemItem: self.item, tag: self.rawValue)
    }
    
    var viewController: UIViewController {
        let storyboard: UIStoryboard
        
        switch self {
        case .search:
            storyboard = UIStoryboard(name: StoryboardHelper.search.name, bundle: nil)
        case .favorite:
            storyboard = UIStoryboard(name: StoryboardHelper.favorite.name, bundle: nil)
        }
        
        guard let viewController = storyboard.instantiateInitialViewController() else {
            return UIViewController()
        }
        let navigationViewController = UINavigationController(rootViewController: viewController)
        navigationViewController.tabBarItem = self.tabBarItem
        
        return navigationViewController
    }
}
