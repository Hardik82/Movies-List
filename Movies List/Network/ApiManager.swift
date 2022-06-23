//
//  ApiManager.swift
//  Movies List
//
//  Created by MacOS on 24/06/22.
//

import Foundation
import SVProgressHUD

struct ApiManager {
    static var helper = ApiManager()
    
    private init() {    }
    
    func apiGetMoviesList(of type: OpenApi, _ result: @escaping ([ClassMoviesListItem]?)->()) {
        SVProgressHUD.show()
        OpenApiNetworkManager.shared.getMoviesList(of: type) { response in
            SVProgressHUD.dismiss()
            switch response {
            case .success(let data):
                result(data.results)
            case .failure(let error):
                self.showErrorAlert(message: error.localizedDescription)
            }
        }
    }
    
    func apiGetMoviesDetails(withId id: Int, _ result: @escaping (ClassMovieDetailsModel?)->()) {
        SVProgressHUD.show()
        OpenApiNetworkManager.shared.getMovieDetails(movieId: id) { response in
            SVProgressHUD.dismiss()
            switch response {
            case .success(let data):
                result(data)
            case .failure(let error):
                self.showErrorAlert(message: error.localizedDescription)
            }
        }
    }
    
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Movies List", message: message, preferredStyle: .alert)
        let okAct = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAct)
        
        let root = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
        root?.present(alert, animated: true, completion: nil)
    }
}

