//
//  CharacterPreview.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import Foundation

struct Data<T: Codable>: Codable {
    var total: Int
    var results: [T]
    
    func isAllCharactersFetched() -> Bool {
        return self.results.count < self.total
    }
}
