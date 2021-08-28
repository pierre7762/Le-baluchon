//
//  NetworkError.swift
//  LeBaluchon
//
//  Created by Pierre on 30/07/2021.
//

import Foundation
import UIKit

enum NetworkErrors: Error {
    case invalidURL, noData, invalidResponse, undecodableData
}

extension NetworkErrors: CustomStringConvertible {
    var description: String {
        switch self {
        case .invalidURL: return "URL invalid"
        case .noData: return "The answer does not contain any data"
        case .invalidResponse: return "The answer is invalide"
        case .undecodableData: return "Decoding problem"
        }
    }
}
