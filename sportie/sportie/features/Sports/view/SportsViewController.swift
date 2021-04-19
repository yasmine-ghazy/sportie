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
    private var presenter: SportsPresenter!

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
        
            dataSource.getLeagues(sportTitle: "Soccer"){ (res) in
                print(res.data?.countrys!)
            }
            
            dataSource.getTeams(leagueId: "4328"){ (res) in
                print(res.data?.teams!)
            }
            
        //id=4328&r=33&s=2020-2021
        dataSource.getLatestResults(leagueId: "4328"){ (res) in
                print(res.data?.results)
            }
            
        dataSource.getUpcomingEvents(leagueId: "4328"){ (res) in
                print(res.data?.events!)
            }
        
        
        
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
        //Navigator.shared.goToMovieDetails(with: itemsList[indexPath.row], from: self)
    }
}
  
//MARK: - UICollectionViewDelegateFlowLayout
extension SportsViewController: UICollectionViewDelegateFlowLayout{
    
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


//MARK: - SportsView
extension SportsViewController: SportsView{
    func getSportsSuccess(items: [Sport]) {
        self.itemsList = items
        collectionView.reloadData()
    }
    
    func getSportsFailed(message: String) {
        UIHelper.shared.showAlert(at: self, message: message)
    }
    
    func noInternet() {
        UIHelper.shared.showAlert(at: self, message: "No Internet")
    }
    
    
}
