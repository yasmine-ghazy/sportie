//
//  MoviesCVC.swift
//  Day4
//
//  Created by Yasmine Ghazy on 04/04/2021.
//  Copyright © 2021 Yasmine Ghazy. All rights reserved.
//

import UIKit


class SportsViewController: BaseVC {
    
    //MARK: - IBOutlets
    @IBOutlet var collectionView: UICollectionView!
    private var presenter: SportsPresenterProtocol!

    //MARK: - Properties
       var itemsList: Array<Sport> = Array(){
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
        
        let yourBackImage = UIImage(systemName: "arrowshape.turn.up.backward.fill")
        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        self.navigationController?.navigationBar.backItem?.title = " "
        self.navigationController?.navigationBar.tintColor = .white
       }
    
    //MARK: - IBActions

}

//MARK: - Methods
extension SportsViewController{
    func setupViews(){
        let dataSource = SportRemoteDataSource()
        let repo = SportRepo(sportDataSource: dataSource)
        presenter = SportsPresenter(repo: repo)
        presenter.attachView(view: self)
        presenter.getSports()
    }
}

// MARK: UICollectionViewDataSource, UICollectionViewDelegate
extension SportsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsList.count
    }


     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SportCollectionViewCell.reuseIdentifier, for: indexPath) as! SportCollectionViewCell
        // Configure the cell
        cell.configureData(item: itemsList[indexPath.row])
        return cell
    }
    

     func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.sportSelected(sport:  itemsList[indexPath.row])
    }
}
  
//MARK: - UICollectionViewDelegateFlowLayout
extension SportsViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width / 2
        return CGSize(width: width, height: width * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


//MARK: - SportsView
extension SportsViewController: SportsView{
    func startLoading() {
        Loader.shared.start(from: self.view)
    }
    
    func finishLoading() {
        Loader.shared.stop()
    }
    
    func showNoInternet() {
        UIHelper.showAlert(at: self, message: "Sorry, No Internet Connection")
    }
    
    func setEmptySports() {
        self.itemsList = []
        let view = CustomView.create(image: UIImage(systemName: "sportscourt.fill")!, title: "No Sports to show")
        collectionView.backgroundView = view
    }
    
    func setSports(items: [Sport]) {
        self.itemsList = items
        collectionView.backgroundView = UIView()
    }
    
    func navigateToLeagues(sport: String) {
        Navigator.shared.gotoLeagues(sportId: sport,from: self)
    }
    
}
