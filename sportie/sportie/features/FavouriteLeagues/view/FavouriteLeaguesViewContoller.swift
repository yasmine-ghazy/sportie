//
//  MoviesTVC.swift
//  Day2
//
//  Created by Yasmine Ghazy on 31/03/2021.
//  Copyright © 2021 Yasmine Ghazy. All rights reserved.
//

import UIKit

class FavouriteLeaguesViewContoller: BaseVC {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Properties
    private var presenter: FavouriteLeaguesPresenter!
    private var itemsList: Array<League> = Array(){
        didSet{
                self.tableView.reloadData()
        }
    }
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    

}

//MARK: - Methods
extension FavouriteLeaguesViewContoller{
    func setupViews(){
        let dataSource = SportRemoteDataSource()
        let repo = LeagueRepo(sportDataSource: dataSource, favoriteDataSource: FavoriteLocalDataSource.shared)
        presenter = FavouriteLeaguesPresenter(repo: repo)
        presenter.attachView(view: self)
        presenter.getFavouriteLeagues()
        

        
//        dataSource.getSports { (res) in
//            print(res.data!.sports!)
//        }
//
//        dataSource.getSports { (res) in
//            print(res.data!.sports!)
//        }
//
//        dataSource.getSports { (res) in
//            print(res.data!.sports!)
//        }
//
//        dataSource.getSports { (res) in
//            print(res.data!.sports!)
//        }
    }
}


// MARK: - Table view data source
extension FavouriteLeaguesViewContoller: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeagueTableViewCell.reuseIdentifier, for: indexPath) as! LeagueTableViewCell
        cell.configureData(item: itemsList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Navigator.shared.goToMovieDetails(with: itemsList[indexPath.row], from: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 5
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Delete", handler: { (action, view, bool) in
            
        })])
    }
}


//MARK: - FavouriteLeaguesView
extension FavouriteLeaguesViewContoller: FavouriteLeaguesView{
    func showFavouriteLeagues(items: [League]) {
        self.itemsList = items
    }
    
    func favouriteLeagueDeleted() {
        
    }
    
    
}
