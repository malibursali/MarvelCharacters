//
//  NetworkService.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import Foundation
import Alamofire

public class NetworkService {
    static let sharedInstance = NetworkService()
    
    func fetchCharacters(_ page: Int, completion: @escaping (_ isSuccess: Bool, _ response: Data<Character>) -> Void) {
        let params: [String: String] = [
            "apikey": PUBLIC_API_KEY,
            "limit": String(characterFetchLimit),
            "offset": String(characterFetchLimit*page),
            "hash": Utility.sharedInstance.getHash(),
            "ts": timestamp
        ]
        
        guard let url = URLBuilder.sharedInstance.buildUrl(path: FETCH_CHARACTERS_URL, params: params) else { return }
        
        AF.request(url).responseDecodable(of: Response<Character>.self) { (response) in
            switch response.result {
            case .success(let result):
                if let data = result.data {
                    completion(true, data)
                }
            case .failure(_):
                completion(false, Data<Character>(total: 0, results: []))
            }
        }
    }
    
    func fetchCharacter(withId id: Int, completion: @escaping (_ isSuccess: Bool, _ response: Data<Character>) -> Void) {
        let params: [String: String] = [
            "apikey": PUBLIC_API_KEY,
            "hash": Utility.sharedInstance.getHash(),
            "ts": timestamp
        ]
        
        guard let url = URLBuilder.sharedInstance.buildUrl(path: FETCH_CHARACTER_URL.replacingOccurrences(of: "XXX", with: String(id)), params: params) else { return }
        
        AF.request(url).responseDecodable(of: Response<Character>.self) { (response) in
            switch response.result {
            case .success(let result):
                if let data = result.data {
                    completion(true, data)
                }
            case .failure(_):
                completion(false, Data<Character>(total: 0, results: []))
            }
        }
    }
    
    func fetchComics(_ id: Int, _ page: Int, completion: @escaping (_ isSuccess: Bool, _ response: Data<Comic>) -> Void) {
        let params: [String: String] = [
            "apikey": PUBLIC_API_KEY,
            "limit": String(comicsFetchLimit),
            "offset": String(comicsFetchLimit*page),
            "dateRange": "\(initialYear),\(Date().getCurrentDateAsString())",
            "hash": Utility.sharedInstance.getHash(),
            "ts": timestamp
        ]
        
        guard let url = URLBuilder.sharedInstance.buildUrl(path: FETCH_COMICS_URL.replacingOccurrences(of: "XXX", with: String(id)), params: params) else { return }
        
        AF.request(url).responseDecodable(of: Response<Comic>.self) { (response) in
            switch response.result {
            case .success(let result):
                if let data = result.data {
                    completion(true, data)
                }
            case .failure(_):
                completion(false, Data<Comic>(total: 0, results: []))
            }
        }
    }
}
