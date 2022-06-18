//
//  OpenApiNetworkManager.swift
//  Movies List
//
//  Created by MacOS on 13/06/22.
//

import Foundation
import Moya
import Alamofire

class DefaultAlamofireSession: Alamofire.Session {
    static let shared: DefaultAlamofireSession = {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.timeoutIntervalForRequest = 60 // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = 60 // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return DefaultAlamofireSession(configuration: configuration)
    }()
}

struct OpenApiNetworkManager {
    static let authPlugin = AccessTokenPlugin { _ in ("eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNTVmMDRhMmE1MWI2OGRiODdhYWQ5NjU2Nzg1NGQ0MCIsInN1YiI6IjYyYWIwNmJlNTU0MWZhMmYyYjZlMmRkMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.F1YtmFUePWcHQsM3_FdFnDt-1liqPpXgS-bM02L8o0M") }
    let provider = MoyaProvider<OpenApi>(session: DefaultAlamofireSession.shared, plugins: [authPlugin])
    fileprivate var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        
        return decoder
    }
    
    static let shared = OpenApiNetworkManager()
    
    func getMoviesList(of type: OpenApi, result: @escaping (Result<ClassMovieListModel, Error>) -> Void) {
        provider.request(type) { requestResult in
            switch requestResult {
            case .success(let response):
                do {
                    switch response.statusCode {
                    case 200:
                        let objMovies = try self.decoder.decode(ClassMovieListModel.self, from: response.data)
                        result(.success(objMovies))
                    default:
                        if let returnData = String(data: response.data, encoding: .utf8) {
                            let error = NetworkError.couldNotParse(paramater: returnData, inside: #function)
                            return result(.failure(error))
                        } else {
                            let error = NetworkError.couldNotParse(paramater: "Error reason", inside: #function)
                            return result(.failure(error))
                        }
                    }
                    
                } catch let error {
                    return result(.failure(error))
                }
            case .failure(let error):
                return result(.failure(error))
            }
        }
    }
    
    func getMovieDetails(movieId: Int, result: @escaping (Result<ClassMovieDetailsModel, Error>) -> Void) {
        provider.request(.getMovieDetails(movieId: movieId)) { requestResult in
            switch requestResult {
            case .success(let response):
                do {
                    switch response.statusCode {
                    case 200:
                        let objLatestMovie = try self.decoder.decode(ClassMovieDetailsModel.self, from: response.data)
                        result(.success(objLatestMovie))
                    default:
                        if let returnData = String(data: response.data, encoding: .utf8) {
                            let error = NetworkError.couldNotParse(paramater: returnData, inside: #function)
                            return result(.failure(error))
                        } else {
                            let error = NetworkError.couldNotParse(paramater: "Error reason", inside: #function)
                            return result(.failure(error))
                        }
                    }
                    
                } catch let error {
                    return result(.failure(error))
                }
            case .failure(let error):
                return result(.failure(error))
            }
        }
    }
    
}
