//
//  ImageType.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 22.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import Foundation

enum ImageType: Int {
    case portrait
    case landscape
    
    var type: String {
        switch self {
        case .portrait:
            return "/portrait_uncanny"
        case .landscape:
            return "/landscape_uncanny"
        }
    }
}
