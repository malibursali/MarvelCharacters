//
//  Thumbnail.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import Foundation

struct Thumbnail: Codable {
    var path: String
    var ext: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
    
    func getCompleteName(withImageType type: ImageType) -> String {
        return "\(self.path)\(type.type).\(self.ext)"
    }
}
