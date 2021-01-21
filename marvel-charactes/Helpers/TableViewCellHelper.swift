//
//  TableViewCellHelper.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import Foundation

enum TableViewCellHelper: Int {
    case character
    
    var name: String {
        switch self {
        case .character:
            return "Character"
        }
    }
    
    var id: String {
        return "\(self.name)TableViewCellID"
    }
}
