//
//  Movies_ListTests.swift
//  Movies ListTests
//
//  Created by mac on 18/06/22.
//

import XCTest
@testable import Movies_List
//import UIKit

class Movies_ListTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        try checkGettingListFromAPI()
        try checkMoviesListItemHasMovieName()
        
        try checkGettingMovieDetailFromAPI()
        try checkGettingMoviePoster()
        
        try checkGettingRandomColor()
    }

    func testPerformanceExample() throws {
        measure {
            try? testExample()
        }
    }
//    func testExample() throws {
//        let input = 40
//        let output = Int(pow(Double(input), 2))
//
//        XCTAssertEqual(input * input, output, "Square by pow is not working")
//    }
    
    
    
    func checkGettingListFromAPI() throws {
        OpenApiNetworkManager.shared.getMoviesList(of: .getTrendingMoviesList) { response in
            switch response {
            case .success(let data):
                XCTAssertNotEqual(data.results?.count ?? 0, 0, "Getting no Items in list")
            case .failure(let error):
                assertionFailure("API getting fail with \(error.localizedDescription)")
            }
        }
    }
    
    func checkMoviesListItemHasMovieName() throws {
        OpenApiNetworkManager.shared.getMoviesList(of: .getPopularMoviesList) { response in
            switch response {
            case .success(let data):
                XCTAssertNotEqual(data.results?.first?.title, nil, "Getting no Items in list")
            case .failure(let error):
                assertionFailure("API getting fail with \(error.localizedDescription)")
            }
        }
    }
    
    func checkGettingMovieDetailFromAPI() throws {
        OpenApiNetworkManager.shared.getMovieDetails(movieId: 155) { response in
            switch response {
            case .success(let data):
                XCTAssertNotEqual(data.originalTitle, nil, "Getting no Movies Details")
            case .failure(let error):
                assertionFailure("API getting fail with \(error.localizedDescription)")
            }
        }
    }
    
    func checkGettingMoviePoster() throws {
        OpenApiNetworkManager.shared.getMovieDetails(movieId: 155) { response in
            switch response {
            case .success(let data):
                guard let path = data.posterPath else {
                    assertionFailure("API not has posterPath")
                    return
                }
                let urlStr = "https://image.tmdb.org/t/p/w500" + path
                let url = URL(string: urlStr)
                XCTAssertNotEqual(url, nil, "Getting non proper URL from API")
            case .failure(let error):
                assertionFailure("API getting fail with \(error.localizedDescription)")
            }
        }
    }
    
    func checkGettingRandomColor() throws {
        let arr = (1...10).map{ _ in UIColor.randomColor }
        XCTAssertEqual(10, Set(arr).count, "Getting same colour multiple times")
    }
}
