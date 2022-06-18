//
//  MoviesDetailsViewController.swift
//  Movies List
//
//  Created by + on 17/06/22.
//

import UIKit

class MoviesDetailsViewController: UIViewController {
    
    @IBOutlet var imageMovie: UIImageView!
    @IBOutlet var imageMovieBackground: UIImageView!
    @IBOutlet var lblBudget: UILabel!
    @IBOutlet var lblRevenue: UILabel!
    @IBOutlet var lblPercentage: UILabel!
    @IBOutlet var lblMovieName: UILabel!
    @IBOutlet var lblTagline: UILabel!
    @IBOutlet var lblGenres: UILabel!
    @IBOutlet var lblMovieDes: UILabel!
    
    var data: ClassMovieDetailsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func setupView() {
        if let posterPath = self.data?.posterPath {
            let image = "https://image.tmdb.org/t/p/w500" + posterPath
            imageMovie.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: ""), completed: nil)
            imageMovie.backgroundColor = .clear
        } else {
            imageMovie.image = UIImage(named: "")
            imageMovie.backgroundColor = .randomColor
        }
        if let backdropPath = self.data?.backdropPath {
            let image = "https://image.tmdb.org/t/p/w500" + backdropPath
            imageMovieBackground.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: ""), completed: nil)
            imageMovieBackground.backgroundColor = .clear
        } else {
            imageMovieBackground.image = UIImage(named: "")
            imageMovieBackground.backgroundColor = .randomColor
        }
        
        
        lblBudget.text = "\(data?.budget ?? 0)"
        lblRevenue.text = "\(data?.revenue ?? 0)"
        
        let per = Int((data?.voteAverage ?? 0) * 10)
        lblPercentage.text = per.description + "%"
        lblPercentage.superview?.setupPercentage(per)
        lblMovieName.text = data?.originalTitle
        lblTagline.text = data?.tagline
        
        lblGenres.text = data?.genres?.compactMap{$0.name}.joined(separator: ", ")
        lblMovieDes.text = data?.overview
    }
}
