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
    
}

//MARK: - Methods
extension LeagueDetailsViewController{
    func setupViews(){
        
        presenter = LeagueDetailsPresenter(
            eventRepo: EventRepo(sportDataSource: SportRemoteDataSource()),
            teamRepo: TeamRepo(sportDataSource: SportRemoteDataSource())
        )
        
        presenter.attachView(view: self)
        
        if let leagueId = item?.idLeague{
            leagueTitleLabel.text = item?.strLeague
            presenter.getTeams(leagueId: leagueId)
            presenter.getUpcomingEvents(leagueId: leagueId)
            presenter.getLatestResults(leagueId: leagueId)
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
        let item = teamsList[indexPath.item]
        Navigator.shared.goToTeamDetails(with: item, from: self)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension LeagueDetailsViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case upcomingEventsCollectionView:
            let height = upcomingEventsCollectionView.frame.size.height - 10
            return CGSize(width: height * 1, height: height)
        case latestResultsCollectionView:
            let width = UIScreen.main.bounds.width - 10
            return CGSize(width: width, height: width * 0.3)
        default:
            let height = teamsCollectionView.frame.size.height - 10
            return CGSize(width: height, height: height)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
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
        UIHelper.showAlert(at: self, message: "Sorry, no Data Available")
    }
    
    func setEmptyLatestResults() {
        UIHelper.showAlert(at: self, message: "Sorry, no Data Available")
    }
    
    func setEmptyTeams() {
        UIHelper.showAlert(at: self, message: "Sorry, no Data Available")
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
    
}

