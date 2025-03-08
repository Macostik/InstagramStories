//
//  APIManager.swift
//  Instagram_test
//
//  Created by Yurii Hranchenko on 08.03.2025.
// 
// Copyright © 2025
// All Rights Reserved.
//

import Foundation
import Alamofire
import Combine

class APIManager {
    
    static let shared = APIManager()
    private let session: Session
    
    private init() {
        var configuration: URLSessionConfiguration {
            let configuration = URLSessionConfiguration.af.default
            configuration.requestCachePolicy = .reloadIgnoringCacheData
            return configuration
        }
           
           session = Session(configuration: configuration)
       }
    
    func fetchPhotos(offset: Int, limit: Int) async throws -> Album {
        try await session.request(FetcherImageRouter.getImages(offset, limit))
            .serializingDecodable(Album.self).value
        }
}

