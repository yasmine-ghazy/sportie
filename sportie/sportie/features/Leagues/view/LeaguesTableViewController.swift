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
        //setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
            
            cell.youtubeAction = { [weak self] in
                self?.presenter?.youtubeSelected(url: item.strYoutube!)
            }
            
            cell.favAction = { [weak self] in
                self?.presenter.favSelected(league: item)
            }
            
            return cell
        }
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            presenter.leagueSelected(league: leagueList[indexPath.row])
        }
        
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UIScreen.main.bounds.height / 7
        }
    }
//MARK: - LeaguesView
extension LeaguesTableViewController:LeaguesView{

    func startLoading() {
        Loader.shared.start(from: self.view)
    }

    func finishLoading() {
        Loader.shared.stop()
    }

    func showNoInternet() {
        UIHelper.showAlert(at: self, message: "No Internet Connection")
    }

    func makeFavorite(league: League) {
        let index = leagueList.firstIndex(where: {$0.idLeague == league.idLeague})!
        leagueList[index].isFav.toggle()
    }

    func setLeagues(leagues: [League]) {
        leagueList = leagues
    }
    
    func showError(message: String) {
        UIHelper.showAlert(at: self, message: message)
    }
    func setEmptyLeagues() {
        let view = CustomView.create(image: UIImage(systemName: "sportscourt.fill")!, title: "No Sports to show")
        tableView.backgroundView = view
    }
    
    func openYoutube(url: String) {
        UIHelper.openURL(url: url)
    }
    
    func goToLeagueDetails(league: League) {
        Navigator.shared.goToLeagueDetails(with: league, from: self)
    }
}
        


