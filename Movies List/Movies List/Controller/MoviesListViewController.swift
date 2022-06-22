//
//  ViewController.swift
//  Movies List
//
//  Created by MacOS on 10/06/22.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    @IBOutlet weak var tblMoviesList: UITableView!
    var tblVM = TableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMoviesList.register(UINib(nibName: "MoviesListTableHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "MoviesListTableHeaderView")
        
        tblMoviesList.dataSource = tblVM
        tblMoviesList.delegate = tblVM
        
        callApis()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func callApis() {
        ApiManager.helper.apiGetMoviesList(of: .getTrendingMoviesList) {
            self.tblVM.arrTrendingMovies = $0
            self.tblMoviesList.reloadData()
        }
        ApiManager.helper.apiGetMoviesList(of: .getTopRatedMoviesList) {
            self.tblVM.arrTopRatedMovies = $0
            self.tblMoviesList.reloadData()
        }
        ApiManager.helper.apiGetMoviesList(of: .getPopularMoviesList) {
            self.tblVM.arrPopularMovies = $0
            self.tblMoviesList.reloadData()
        }
    }
}
