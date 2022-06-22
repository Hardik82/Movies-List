//
//  MoviesListTableViewCell.swift
//  Movies List
//
//  Created by MacOS on 12/06/22.
//

import UIKit

class MoviesListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionMoviesList: UICollectionView!
    
    var collectionVM = CollectionViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setList(list: [ClassMoviesListItem]) {
        collectionVM.arrMovies = list
        
        collectionMoviesList.delegate = collectionVM
        collectionMoviesList.dataSource = collectionVM
    }
}
