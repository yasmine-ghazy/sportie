//
//  LeaguesTableViewController.swift
//  sportie
//
//  Created by Mahmoud Mohamed on 21/04/2021.
//

import UIKit

class LeaguesTableViewController: UITableViewController {

    public var sportTitle:String!
    private var presenter:LeaguesPresenterProtocol!
    private var leagueList: Array<League> = Array(){
        didSet{
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

//MARK: - Methods
extension LeaguesTableViewController{
    
    func setupViews(){
        tableView.register(UINib(nibName: LeagueTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: LeagueTableViewCell.reuseIdentifier)
        
        let leagueDatasource = SportRemoteDataSource()
        let favoriteDatasource = FavoriteLocalDataSource()
        let leagueRepo = LeagueRepo(sportDataSource: leagueDatasource,favoriteDataSource: favoriteDatasource)
        
        presenter = LeaguesPresenter(leagueRepo: leagueRepo)
        presenter.attachView(view: self)
        presenter.getAllLeagues(sportTitle:sportTitle)
        
        self.title = sportTitle
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
            
            let item = leagueList[indexPath.row]
            cell.configureData(item: item)
            cell.youtubeAction = {
                UIHelper.openURL(url: item.strYoutube!)
            }
            
            cell.favAction = { [weak self] in
                self?.leagueList[indexPath.row].isFav = !item.isFav
                if item.isFav{
                    self?.presenter.removeFavourite(idLeague: item.idLeague)
                }else{
                    self?.presenter.makeFavorite(league: item)
                }
            }
            
            return cell
        }
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            Navigator.shared.goToLeagueDetails(with: leagueList[indexPath.row], from: self)
        }
        
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UIScreen.main.bounds.height / 7
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
    Loader.shared.start(from: self.view)
}

func finishLoading() {
    Loader.shared.stop()
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
        


