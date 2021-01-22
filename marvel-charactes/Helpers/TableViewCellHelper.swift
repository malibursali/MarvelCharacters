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
    case characterInfo
    case comic
    
    var name: String {
        switch self {
        case .character:
            return "Character"
        case .characterInfo:
            return "CharacterInfo"
        case .comic:
            return "Comic"
        }
    }
    
    var id: String {
        return "\(self.name)TableViewCellID"
    }
}
