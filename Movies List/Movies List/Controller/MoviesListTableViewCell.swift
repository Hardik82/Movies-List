//
//  MoviesListTableViewCell.swift
//  Movies List
//
//  Created by MacOS on 12/06/22.
//

import UIKit
import SDWebImage
import SVProgressHUD

class MoviesListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionMoviesList: UICollectionView!
    
    var arrMovies: [ClassMoviesListItem]?
    var tableViewSection = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionMoviesList.delegate = self
        collectionMoviesList.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension MoviesListTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMovies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesListCollectionViewCell", for: indexPath) as! MoviesListCollectionViewCell
     
        let item =  self.arrMovies![indexPath.item]
        
        if let posterPath = item.posterPath {
            let image = "https://image.tmdb.org/t/p/w500" + posterPath
            cell.imgMovie.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: ""), completed: nil)
            cell.imgMovie.backgroundColor = .clear
        } else {
            cell.imgMovie.image = UIImage(named: "")
            cell.imgMovie.backgroundColor = .randomColor
        }
        
        cell.lblMovieName.text = item.originalTitle
        cell.lblDate.text = item.releaseDate
        
        let per = Int((item.voteAverage ?? 0) * 10)
        cell.lblPercentage.text = per.description + "%"
        cell.lblPercentage.superview?.setupPercentage(per)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let id = self.arrMovies?[indexPath.item].id {
            apiGetMoviesDetails(withId: id)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 300)
    }
}

extension MoviesListTableViewCell {
    func apiGetMoviesDetails(withId id: Int) {
        SVProgressHUD.show()
        OpenApiNetworkManager.shared.getMovieDetails(movieId: id) { response in
            SVProgressHUD.dismiss()
            switch response {
            case .success(let data):
                let new = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MoviesDetailsViewController") as! MoviesDetailsViewController
                new.data = data
                
                let root = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
                root?.pushViewController(new, animated: true)
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
