//
//  EndPoint.swift
//  TopChart2
//
//  Created by MacBookAir on 19.08.2023.
//

import Foundation

protocol EndPointProtocol {
    var baseURL : String { get }
    var path: String { get }
    var method: HTTPMethodType { get }
    var header : [String: String]? { get }
    
    func request() -> URLRequest
}

enum EndPoint {
    case turkeyTopMusic
    case globalTopMusic
}

extension EndPoint: EndPointProtocol {
    var baseURL: String {
        return BASE_URL
    }
    
    var path: String {
        switch self {
        case .turkeyTopMusic:
            return "/api/v2/tr/music/most-played/25/songs.json"
        case .globalTopMusic:
            return "/api/v2/us/music/most-played/25/songs.json"
        }
    }
    
    var method: HTTPMethodType {
        return .get
    }
    
    var header: [String : String]? {
        return nil
    }
    
    func request() -> URLRequest {
        guard let url = URL(string: baseURL + path) else { fatalError("Invalid URL") }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = header
        
        return urlRequest
    }
    
    
}
