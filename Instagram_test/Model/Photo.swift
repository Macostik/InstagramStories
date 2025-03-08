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
struct Photo: Equatable, Identifiable, Hashable {
    let id: Int
    let title: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case url
        case isLiked
    }
}

extension Photo: Decodable {
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
      id = try container.decode(Int.self, forKey: .id)
      title = try container.decode(String.self, forKey: .title)
      url = try container.decode(String.self, forKey: .url)
  }
}

