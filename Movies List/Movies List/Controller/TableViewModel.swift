//
//  TableViewModel.swift
//  Movies List
//
//  Created by MacOS on 22/06/22.
//

import UIKit

class TableViewModel: NSObject {
    var arrTrendingMovies: [ClassMoviesListItem]?
    var arrTopRatedMovies: [ClassMoviesListItem]?
    var arrPopularMovies: [ClassMoviesListItem]?
}


extension TableViewModel: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vwHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MoviesListTableHeaderView") as! MoviesListTableHeaderView
        vwHeader.lblSectionTitle.text = ["Trending", "Top Rated Movies", "What's Popular"][section]
        return vwHeader
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesListTableViewCell", for: indexPath) as! MoviesListTableViewCell
        let arr = [self.arrTrendingMovies, self.arrTopRatedMovies, self.arrPopularMovies]
        
        cell.setList(list: arr[indexPath.section] ?? [])
        
        cell.collectionMoviesList.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

