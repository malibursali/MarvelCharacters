//
//  CharacterResult.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import Foundation

struct Character: Codable {
    var id: Int
    var name: String
    var description: String
    var thumbnail: Thumbnail
}
