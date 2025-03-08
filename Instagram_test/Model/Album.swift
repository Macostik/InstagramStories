//
//  Album.swift
//  Instagram_test
//
//  Created by Yurii Hranchenko on 08.03.2025.
// 
// Copyright © 2025
// All Rights Reserved.
//

import Foundation

public struct Album: Hashable {
    var photos: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case photos
    }
}

extension Album: Decodable {
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
      photos = try container.decode([Photo].self, forKey: .photos)
  }
}
