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
    case characters
    case characterDetail
    case favorite
    
    var name: String {
        switch self {
        case .splash:
            return "SplashScreen"
        case .main:
            return "MainScreen"
        case .characters:
            return "CharactersScreen"
        case .characterDetail:
            return "CharacterDetailScreen"
        case .favorite:
            return "FavoriteScreen"
        }
    }
}
