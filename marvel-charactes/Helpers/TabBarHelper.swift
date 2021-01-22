//
//  TabBarHelper.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import UIKit

enum TabBarHelper: Int, CaseIterable {
    case characters
    case favorite
    
    var item: UITabBarItem.SystemItem {
        switch self {
        case .characters:
            return .search
        case .favorite:
            return .favorites
        }
    }
    
    var title: String {
        switch self {
        case .characters:
            return "Characters"
        case .favorite:
            return "Favorite"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .characters:
            return ImageHelper.charactersIcon.image
        case .favorite:
            return ImageHelper.favoriteIcon.image
        }
    }
    
    var tabBarItem: UITabBarItem {
        return UITabBarItem(title: self.title, image: self.image, tag: self.rawValue)
    }
    
    var viewController: UIViewController {
        let storyboard: UIStoryboard
        
        switch self {
        case .characters:
            storyboard = UIStoryboard(name: StoryboardHelper.characters.name, bundle: nil)
        case .favorite:
            storyboard = UIStoryboard(name: StoryboardHelper.characterDetail.name, bundle: nil)
        }
        
        guard let viewController = storyboard.instantiateInitialViewController() else {
            return UIViewController()
        }
        let navigationViewController = UINavigationController(rootViewController: viewController)
        navigationViewController.tabBarItem = self.tabBarItem
        
        return navigationViewController
    }
}
