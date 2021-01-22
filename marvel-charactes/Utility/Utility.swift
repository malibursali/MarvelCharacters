//
//  Utility.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import Foundation
import CryptoKit

public class Utility {
    static let sharedInstance = Utility()
    let userDefaults = UserDefaults.standard
    
    func saveFavoriteCharacter(_ id: Int) {
        self.userDefaults.set(id, forKey: "Favorite")
    }
    
    func getFavoriteCharacter() -> Int {
        self.userDefaults.integer(forKey: "Favorite")
    }
    
    func getHash() -> String {
        guard let data = "\(timestamp)\(PRIVATE_API_KEY)\(PUBLIC_API_KEY)".data(using: .utf8) else { return "" }
        let hashDigest = Insecure.MD5.hash(data: data)
        let hash = hashDigest.map { String(format: "%02hhx", $0) }.joined()
        
        return hash
    }
}
