//
//  LeaguesTableViewController.swift
//  sportie
//
//  Created by Mahmoud Mohamed on 21/04/2021.
//

import UIKit

class LeaguesTableViewController: UITableViewController {

    public var sportId:String!
    private var presenter:LeaguesPresenterProtocol!
    private var leagueList: Array<League> = Array(){
        didSet{
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
}

//MARK: - Methods
extension LeaguesTableViewController{
    
    func setViews(){
        tableView.register(UINib(nibName: LeagueTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: LeagueTableViewCell.reuseIdentifier)
        
        let leagueDatasource = SportRemoteDataSource()
        let favoriteDatasource = FavoriteLocalDataSource()
        let leagueRepo = LeagueRepo(sportDataSource: leagueDatasource,favoriteDataSource: favoriteDatasource)
        
        presenter = LeaguesPresenter(leagueRepo: leagueRepo)
        presenter.attachView(view: self)
        presenter.getAllLeagues(sportTitle:sportId)
        presenter.getFavoriteLeagues()
    }
}
    // MARK: - Table view data source
extension LeaguesTableViewController{
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
            return leagueList.count
    }
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: LeagueTableViewCell.reuseIdentifier, for: indexPath) as! LeagueTableViewCell
            cell.configureData(item: leagueList[indexPath.row])
            return cell
        }
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //Navigator.shared.goToMovieDetails(with: itemsList[indexPath.row], from: self)
        }
        
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UIScreen.main.bounds.height / 5
        }
        
        override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Delete", handler: { (action, view, bool) in
                self.presenter.removeFavourite(idLeague: self.leagueList[indexPath.row].idLeague)
            })])
        }
    }
//MARK: - LeaguesView
extension LeaguesTableViewController:LeaguesView{
    func setFavourites(leagues: [League]) {
        
    }
    
func startLoading() {
    
}

func finishLoading() {
    
}

func showNoInternet() {
    
}

func makeFavorite(league: League) {
    
}

func removeFavorite(idLeague: String) {
    
}

func setLeagues(leagues: [League]) {
    leagueList = leagues
}

func showError(message: String) {
    UIHelper.showAlert(at: self, message: message)
}



func setEmptyLeagues() {
    UIHelper.showAlert(at: self, message: "empty data")
}
}
        


