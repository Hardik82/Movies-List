//
//  MoviesListCollectionViewCell.swift
//  Movies List
//
//  Created by MacOS on 12/06/22.
//

import UIKit

class MoviesListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var vwContainer: UIView!
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var vwPercentageContent: UIView!
    @IBOutlet weak var lblPercentage: UILabel!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgMovie.layer.cornerRadius = 10.0
        vwPercentageContent.layer.cornerRadius = vwPercentageContent.frame.width / 2
    }
    
    func setData(item: ClassMoviesListItem) {
        imgMovie.setUrl(withPath: item.posterPath)
        
        lblMovieName.text = item.originalTitle
        lblDate.text = item.releaseDate
        
        let per = Int((item.voteAverage ?? 0) * 10)
        lblPercentage.text = per.description + "%"
        lblPercentage.superview?.setupPercentage(per)
    }
}
