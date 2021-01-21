//
//  ColorsHelper.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import UIKit

enum ColorHelper: Int {
    case hexFA2000
    
    var color: UIColor {
        switch self {
        case .hexFA2000:
            return UIColor(named: "FA2000") ?? .clear
        }
    }
}
