//
//  OpenApi.swift
//  Movies List
//
//  Created by MacOS on 13/06/22.
//

import Foundation
import Moya
import Alamofire

enum OpenApi {
    case getTrendingMoviesList
    case getTopRatedMoviesList
    case getPopularMoviesList
    case getMovieDetails(movieId: Int)
}

extension OpenApi: Moya.TargetType {
    
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/")!
    }
    
    var path: String {
        switch self {
        case .getTrendingMoviesList:
            return "3/trending/movie/week"
        case .getTopRatedMoviesList:
            return "3/movie/top_rated"
        case .getPopularMoviesList:
            return "3/movie/popular"
        case .getMovieDetails(let movieId):
            return "3/movie/\(movieId)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
//        switch self {
//        case .getTopRatedMoviesList, .getPopularMoviesList, .getMovieDetails(_), .getTrendingMoviesList: break
//        }
        return .requestParameters(parameters: ["api_key": "f55f04a2a51b68db87aad96567854d40"], encoding: URLEncoding.queryString)
    }
    
    var headers: [String: String]? {
        let headersParam: [String: String] = ["Accept": "application/json"]
        return headersParam
    }
    
    var validationType: ValidationType {
        return .none
    }
}

extension OpenApi: Moya.AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}
