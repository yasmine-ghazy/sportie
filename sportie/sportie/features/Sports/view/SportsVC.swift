//
//  MoviesCVC.swift
//  Day4
//
//  Created by Yasmine Ghazy on 04/04/2021.
//  Copyright © 2021 Yasmine Ghazy. All rights reserved.
//

import UIKit


class SportsVC: BaseVC {
    
    //MARK: - IBOutlets
    @IBOutlet var collectionView: UICollectionView!
    
    //MARK: - Properties
       var itemsList: Array<Movie> = Array(){
           didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           }
       }
    
     //MARK: - View Lifecycle
       override func viewDidLoad() {
           super.viewDidLoad()
           setupViews()
       }
    
    //MARK: - IBActions

}

//MARK: - Methods
extension SportsVC{
    func setupViews(){
        itemsList = Array(arrayLiteral:
            Movie(title: "Dawn of the Planet of the Apes", image: "https://api.androidhive.info/json/movies/1.jpg", releaseYear: 2014, rating: 8.3, genre: "Drama"),
                          Movie(title: "District 9", image: "https://api.androidhive.info/json/movies/2.jpg", releaseYear: 2009, rating: 8.0, genre: "Drama"),
                          Movie(title: "Transformers: Age of Extinction", image: "https://api.androidhive.info/json/movies/3.jpg", releaseYear: 2014, rating:  6.3, genre: "Action"),
                          Movie(title: "X-Men: Days of Future Past", image: "https://api.androidhive.info/json/movies/4.jpg", releaseYear: 2014, rating: 8.4, genre:  "Action"),
                          Movie(title: "Tangled", image: "https://api.androidhive.info/json/movies/8.jpg", releaseYear: 2014, rating: 8.3, genre: "Drama")
        )
    }
}

// MARK: UICollectionViewDataSource, UICollectionViewDelegate
extension SportsVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsList.count
    }


     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SportCVC.reuseIdentifier, for: indexPath) as! SportCVC
        // Configure the cell
        cell.configureData(item: itemsList[indexPath.row])
        return cell
    }

     func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Navigator.shared.goToMovieDetails(with: itemsList[indexPath.row], from: self)
    }
}
  
//MARK: - UICollectionViewDelegateFlowLayout
extension SportsVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width / 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
