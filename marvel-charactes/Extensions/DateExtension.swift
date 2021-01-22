//
//  DateExtension.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 22.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import Foundation

extension Date {
    func getCurrentDateAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        let result = formatter.string(from: self)

        return result
    }
}
