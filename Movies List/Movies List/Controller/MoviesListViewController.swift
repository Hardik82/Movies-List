//
//  ViewController.swift
//  Movies List
//
//  Created by MacOS on 10/06/22.
//

import UIKit
import SVProgressHUD

class MoviesListViewController: UIViewController {
    
    @IBOutlet weak var tblMoviesList: UITableView!
    
    var arrTrendingMovies: [ClassMoviesListItem]?
    var arrTopRatedMovies: [ClassMoviesListItem]?
    var arrPopularMovies: [ClassMoviesListItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMoviesList.register(UINib(nibName: "MoviesListTableHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "MoviesListTableHeaderView")
        apiGetMoviesList(of: .getTrendingMoviesList)
        apiGetMoviesList(of: .getTopRatedMoviesList)
        apiGetMoviesList(of: .getPopularMoviesList)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vwHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MoviesListTableHeaderView") as! MoviesListTableHeaderView
        vwHeader.lblSectionTitle.text = ["Trending", "Top Rated Movies", "What's Popular"][section]
        return vwHeader
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesListTableViewCell", for: indexPath) as! MoviesListTableViewCell
        cell.tableViewSection = indexPath.section
        let arr = [self.arrTrendingMovies, self.arrTopRatedMovies, self.arrPopularMovies]
        cell.arrMovies = arr[indexPath.section]
        cell.collectionMoviesList.reloadSections(IndexSet(0...0))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

extension MoviesListViewController {
    func apiGetMoviesList(of type: OpenApi) {
        SVProgressHUD.show()
        OpenApiNetworkManager.shared.getMoviesList(of: type) { response in
            SVProgressHUD.dismiss()
            switch response {
            case .success(let data):
                switch type {
                case .getTrendingMoviesList: self.arrTrendingMovies = data.results
                case .getTopRatedMoviesList: self.arrTopRatedMovies = data.results
                case .getPopularMoviesList: self.arrPopularMovies = data.results
                default: break
                }
                self.tblMoviesList.reloadData()
            case .failure(let error):
                self.showErrorAlert(message: error.localizedDescription)
            }
        }
    }
    
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Movies List", message: message, preferredStyle: .alert)
        let okAct = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAct)
        self.present(alert, animated: true, completion: nil)
    }
}
