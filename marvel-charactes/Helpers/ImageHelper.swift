//
//  ImageHelper.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import UIKit

enum ImageHelper: Int {
    case charactersIcon
    case favoriteIcon
    case loadingIcon
    case heart
    case heartFill
    
    var imageName: String {
        switch self {
        case .charactersIcon:
            return "CharactersIcon"
        case .favoriteIcon:
            return "FavoriteIcon"
        case .loadingIcon:
            return "LoadingIcon"
        case .heart:
            return "heart"
        case .heartFill:
            return "heart.fill"
        }
    }
    
    var image: UIImage? {
        return UIImage(named: self.imageName)
    }
    
    var systemImage: UIImage? {
        return UIImage(systemName: self.imageName)
    }
    
    var originalImage: UIImage? {
        return self.image?.withRenderingMode(.alwaysOriginal)
    }
    
    var templateImage: UIImage? {
        return self.image?.withRenderingMode(.alwaysTemplate)
    }
}

