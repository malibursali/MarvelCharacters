//
//  StoryboardHelper.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import UIKit

enum StoryboardHelper: Int {
    case splash
    case main
    case search
    case favorite
    
    var name: String {
        switch self {
        case .splash:
            return "SplashScreen"
        case .main:
            return "MainScreen"
        case .search:
            return "SearchScreen"
        case .favorite:
            return "FavoriteScreen"
        }
    }
}