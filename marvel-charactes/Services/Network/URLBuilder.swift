//
//  URLBuilder.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import Foundation

public class URLBuilder {
    static let sharedInstance = URLBuilder()
    
    func buildUrl(path: String) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = BASE_URL
        urlComponents.path = path
        
        return urlComponents.url
    }
    
    func buildUrl(path: String, params: [String: String]) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = BASE_URL
        urlComponents.path = path
        urlComponents.queryItems = self.buildQueryItems(params)
        
        return urlComponents.url
    }
    
    private func buildQueryItems(_ params: [String: String]) -> [URLQueryItem] {
        return params.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
