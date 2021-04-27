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
    private var presenter: FavouriteLeaguesPresenterProtocol!
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getFavouriteLeagues()
    }
    

}

//MARK: - Methods
extension FavouriteLeaguesViewContoller{
    func setupViews(){
        
        tableView.register(UINib(nibName: LeagueTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: LeagueTableViewCell.reuseIdentifier)
        
        let sportDataSource = SportRemoteDataSource()
        let favoriteDataSource = FavoriteLocalDataSource()
        let repo = LeagueRepo(sportDataSource: sportDataSource, favoriteDataSource: favoriteDataSource)
        presenter = FavouriteLeaguesPresenter(repo: repo)
        presenter.attachView(view: self)
        
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
        
        let item = itemsList[indexPath.row]
        cell.configureData(item: item)
        cell.youtubeAction = {
            UIHelper.openURL(url: item.strYoutube!)
        }
        
        cell.favAction = { [weak self] in
            self?.presenter.deleteFavourite(leagueId: (self?.itemsList[indexPath.row].idLeague)!)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! LeagueTableViewCell).configureData(item: itemsList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Navigator.shared.goToLeagueDetails(with: itemsList[indexPath.row], from: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 7
    }
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Delete", handler: { (action, view, bool) in
//            self.presenter.deleteFavourite(leagueId: self.itemsList[indexPath.row].idLeague)
//        })])
//    }
}


//MARK: - FavouriteLeaguesView
extension FavouriteLeaguesViewContoller: FavouriteLeaguesView{
    func favouriteDeleted(leagueId: String) {
        if let index = self.presenter.getIndex(for: leagueId, in: itemsList){
            itemsList.remove(at: index)
        }
    }
    
    func showError(message: String) {
        UIHelper.showAlert(at: self, message: message)
    }
    
    func setFavourites(leagues: [League]) {
        itemsList = leagues
    }
    
    func setEmptyFavourites() {
        UIHelper.showAlert(at: self, message: "empty data")
    }
}
