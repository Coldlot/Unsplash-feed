//
//  UFResponseCode.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 02.12.2021.
//

import Foundation

enum UFResponseCode {
    case ok
    case badRequest
    case unAuthorized
    case forbidden
    case notFound
    case serverSide
    case unknown
    
    static func code(_ code: Int) -> UFResponseCode {
        switch code {
        case 200:
            return .ok
        case 400:
            return .badRequest
        case 401:
            return .unAuthorized
        case 403:
            return .forbidden
        case 404:
            return .notFound
        case 500, 503:
            return .serverSide
        default:
            return .unknown
        }
    }
    
    var isError: Bool {
        return self != .ok
    }
    
    var description: String {
        switch self {
        case .ok:
            return "Everything worked as expected"
        case .badRequest:
            return "The request was unacceptable, often due to missing a required parameter"
        case .unAuthorized:
            return "Invalid Access Token"
        case .forbidden:
            return "Missing permissions to perform request"
        case .notFound:
            return "The requested resource doesn’t exist"
        case .serverSide:
            return "Something went wrong on our end"
        case .unknown:
            return "Unknown error"
        }
    }
}
