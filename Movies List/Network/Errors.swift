//
//  Errors.swift
//  Movies List
//
//  Created by MacOS on 16/06/22.
//

import Foundation

enum NetworkError: LocalizedError {
    case couldNotConvertIntoDictionary(inside: String)
    case couldNotParse(paramater: String, inside: String)
    case badResponceStatusCode(_ code: Int)
    
    var errorDescription: String? {
        switch self {
        case .couldNotConvertIntoDictionary, .couldNotParse:
            return "Something went wrong!"
        case .badResponceStatusCode(let code):
            return "Bad response status code: \(code)"
        }
    }
}

struct GeneralError: LocalizedError {
    let message: String
    var errorDescription: String? { return message }
}
