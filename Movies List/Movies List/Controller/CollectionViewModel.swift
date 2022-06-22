//
//  CollectionViewModel.swift
//  Movies List
//
//  Created by MacOS on 22/06/22.
//

import UIKit

class CollectionViewModel: NSObject {
    var arrMovies: [ClassMoviesListItem]?
}


extension CollectionViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMovies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesListCollectionViewCell", for: indexPath) as! MoviesListCollectionViewCell
        
        let item =  self.arrMovies![indexPath.item]
        cell.setData(item: item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let id = self.arrMovies?[indexPath.item].id {
            ApiManager.helper.apiGetMoviesDetails(withId: id) {
                let new = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MoviesDetailsViewController") as! MoviesDetailsViewController
                new.data = $0
                
                let root = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
                root?.pushViewController(new, animated: true)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 300)
    }
}
