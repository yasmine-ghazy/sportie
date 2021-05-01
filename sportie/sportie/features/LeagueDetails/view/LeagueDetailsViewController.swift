//
//  LeagueDetailsViewController.swift
//  sportie
//
//  Created by Yasmine Ghazy on 22/04/2021.
//

import UIKit

class LeagueDetailsViewController: BaseVC {
    
    //MARK: - IBOutlets
    @IBOutlet var teamsCollectionView: UICollectionView!
    @IBOutlet var upcomingEventsCollectionView: UICollectionView!
    @IBOutlet var latestResultsCollectionView: UICollectionView!
    @IBOutlet weak var leagueTitleLabel: UILabel!
    @IBOutlet weak var favButton: FavButton!

    
    //MARK: - Properties
    private var presenter: LeagueDetailsPresenterProtocol!
    var item: League?
    
    var teamsList: Array<Team> = Array(){
        didSet{
            DispatchQueue.main.async {
                self.teamsCollectionView.reloadData()
            }
        }
    }
    
    var upcomingEventsList: Array<Event> = Array(){
        didSet{
            DispatchQueue.main.async {
                self.upcomingEventsCollectionView.reloadData()
            }
        }
    }
    
    var latestResultsList: Array<Event> = Array(){
        didSet{
            DispatchQueue.main.async {
                self.latestResultsCollectionView.reloadData()
            }
        }
    }
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    
    //MARK: - IBActions
    @IBAction func backClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func favClicked(_ sender: Any){
        if let item = item{
            self.presenter.favSelected(league: item)
        }
    }
    
}

//MARK: - Methods
extension LeagueDetailsViewController{
    func setupViews(){
        
        upcomingEventsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        teamsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        latestResultsCollectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        leagueTitleLabel.text = item?.strLeague
        
        setupPresenter()
        setupFav()
        
    }
    
    func setupPresenter(){
        presenter = LeagueDetailsPresenter(
            eventRepo: EventRepo(sportDataSource: SportRemoteDataSource()),
            teamRepo: TeamRepo(sportDataSource: SportRemoteDataSource()), leagueRepo: LeagueRepo(sportDataSource: SportRemoteDataSource(), favoriteDataSource: FavoriteLocalDataSource())
        )
        presenter.attachView(view: self)
        if let item = item, let leagueId = item.idLeague{
            presenter.getData(leagueId: leagueId)
        }
    }
    
    func setupFav(){
        if let item = item{
            favButton.setFaved(item.isFav ?? false)
        }
    }
}

// MARK: UICollectionViewDataSource, UICollectionViewDelegate
extension LeagueDetailsViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case upcomingEventsCollectionView:
            return upcomingEventsList.count
        case latestResultsCollectionView:
            return latestResultsList.count
        default:
            return teamsList.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case upcomingEventsCollectionView:
            let cell = upcomingEventsCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingEventCollectionViewCell.reuseIdentifier, for: indexPath) as! UpcomingEventCollectionViewCell
            // Configure the cell
            cell.configureData(item: upcomingEventsList[indexPath.item])
            return cell
            
        case latestResultsCollectionView:
            let cell = latestResultsCollectionView.dequeueReusableCell(withReuseIdentifier: LatestResultCollectionViewCell.reuseIdentifier, for: indexPath) as! LatestResultCollectionViewCell
            // Configure the cell
            cell.configureData(item: latestResultsList[indexPath.item])
            return cell
            
        default:
            let cell = teamsCollectionView.dequeueReusableCell(withReuseIdentifier: TeamCollectionViewCell.reuseIdentifier, for: indexPath) as! TeamCollectionViewCell
            // Configure the cell
            cell.configureData(item: teamsList[indexPath.item])
            return cell
        }
    }
}

extension LeagueDetailsViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == teamsCollectionView{
            let item = teamsList[indexPath.item]
            Navigator.shared.goToTeamDetails(with: item, from: self)
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension LeagueDetailsViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var size = CGSize()
        
        switch collectionView {
        case upcomingEventsCollectionView:
            size.height = upcomingEventsCollectionView.frame.size.height
            size.width = size.height
        case latestResultsCollectionView:
            size.width = UIScreen.main.bounds.width - 10
            size.height = size.width * 0.25
        default:
            size.height = teamsCollectionView.frame.size.height
            size.width = size.height
        }
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}


//MARK: - SportsView
extension LeagueDetailsViewController: LeagueDetailsView{

    
    func startLoading() {
        Loader.shared.start(from: self.view)
    }
    
    func finishLoading() {
        Loader.shared.stop()
    }
    
    func showNoInternet() {
        UIHelper.showAlert(at: self, message: "Sorry, no Internet Available")
    }
    
    //Empty
    func setEmptyUpcomingEvents() {
        UIHelper.showAlert(at: self, message: "Sorry, no Upcoming Events Available")
    }
    
    func setEmptyLatestResults() {
        UIHelper.showAlert(at: self, message: "Sorry, no LatestResults Available")
    }
    
    func setEmptyTeams() {
        UIHelper.showAlert(at: self, message: "Sorry, no Teams Available")
    }
    
    //Set Data
    func setUpcomintEvents(items: [Event]) {
        self.upcomingEventsList = items
    }
    
    func setLatestResults(items: [Event]) {
        self.latestResultsList = items
    }
    
    func setTeams(items: [Team]) {
        self.teamsList = items
    }
    
    func makeFavorite(league: League){
        item?.isFav.toggle()
        favButton.toggle()
    }
    
    func showError(message: String) {
        UIHelper.showAlert(at: self, message: message)
    }
    
}

