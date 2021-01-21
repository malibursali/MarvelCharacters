//
//  StringExtension.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import UIKit


extension String {
    
    func getURL() -> URL? {
        let url = URL(string: self)
        return url
    }
}
