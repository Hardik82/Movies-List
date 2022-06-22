//
//  MoviesDetailsViewController.swift
//  Movies List
//
//  Created by MacOS on 17/06/22.
//

import UIKit
import SDWebImage

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
        imageMovie.setUrl(withPath: self.data?.posterPath)
        imageMovieBackground.setUrl(withPath: self.data?.backdropPath)
        
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
