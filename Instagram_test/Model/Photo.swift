//
//  Photo.swift
//  Instagram_test
//
//  Created by Yurii Hranchenko on 08.03.2025.
// 
// Copyright © 2025
// All Rights Reserved.
//

import Foundation

// Define a struct to match the API response
struct Photo: Codable, Equatable, Identifiable, Hashable {
    let id: Int
    let title: String
    let url: String
}

