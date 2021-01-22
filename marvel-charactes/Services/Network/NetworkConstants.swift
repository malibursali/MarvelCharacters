//
//  NetworkConstants.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import Foundation

let PUBLIC_API_KEY = "db5452241ac769d460ce2529050d0f40"
let PRIVATE_API_KEY = "207171ca6f8629b607bf4e698fa98da1658d988e"

let BASE_URL = "gateway.marvel.com"
let FETCH_CHARACTERS_URL = "/v1/public/characters"
let FETCH_CHARACTER_URL = "\(FETCH_CHARACTERS_URL)/XXX"
let FETCH_COMICS_URL = "\(FETCH_CHARACTERS_URL)/XXX/comics"

let timestamp = "1"

let characterFetchLimit = 30
let comicsFetchLimit = 10

let initialYear = "2005-01-01"
