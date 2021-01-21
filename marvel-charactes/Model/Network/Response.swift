//
//  CharacterResponse.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import Foundation

struct Response<T: Codable>: Codable {
    var data: Data<T>?
    var errorMessage: String?
}
