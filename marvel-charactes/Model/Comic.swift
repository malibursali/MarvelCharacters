//
//  Comic.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 22.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import Foundation

struct Comic: Codable {
    var id: Int
    var title: String
    var description: String
    var thumbnail: Thumbnail
}
