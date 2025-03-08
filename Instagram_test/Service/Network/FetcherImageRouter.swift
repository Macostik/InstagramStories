//
//  FetcherImageRouter.swift
//  Instagram_test
//
//  Created by Yurii Hranchenko on 08.03.2025.
// 
// Copyright © 2025
// All Rights Reserved.
//

import Foundation
import Alamofire

enum FetcherImageRouter {
    case getImages(Int, Int)
}

extension FetcherImageRouter {
    var baseURL: String {
        switch self {
        case .getImages:
            return Constant.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .getImages:
            return "/sample-data/photos"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getImages:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getImages(let offset, let limit):
            return ["offset": offset, "limit": limit]
        }
    }
}

extension FetcherImageRouter: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        var url = try baseURL.asURL()
        if !path.isEmpty {
            url = url.appendingPathComponent(path)
        }
        var request = URLRequest(url: url)
        request.timeoutInterval = Constant.timeOutInterval
        request.method = method
        if method == .post {
            request = try JSONEncoding.default.encode(request, with: parameters)
            request.setValue("application/json", forHTTPHeaderField: "Accept")
        } else {
            request = try URLEncoding.default.encode(request, with: parameters)
        }
        return request
    }
}

