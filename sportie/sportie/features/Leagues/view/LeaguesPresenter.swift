//
//  LeaguesPresenter.swift
//  sportie
//
//  Created by Mahmoud Mohamed on 21/04/2021.
//

import Foundation

protocol LeaguesView {
    func startLoading()
    func finishLoading()
    func showNoInternet()
    func makeFavorite(league:League)
    func removeFavorite(idLeague:String)
    func setLeagues(leagues:[League])
    func showError(message: String)
    func setFavourites(leagues: [League])
    func setEmptyLeagues()
}

protocol LeaguesPresenterProtocol {
    func attachView(view: LeaguesView)
    func dettachView()
    func removeFavourite(idLeague: String)
    func getAllLeagues(sportTitle:String)
    func getFavoriteLeagues()
    func makeFavorite(league:League)
    
}

class LeaguesPresenter:LeaguesPresenterProtocol{
    
    
    
    func getFavoriteLeagues() {
        if let favoriteLeague = leagueRepo?.getFavouriteLeagues(),!favoriteLeague.isEmpty{
            self.view?.setFavourites(leagues: favoriteLeague)
        }
    }
    
    func makeFavorite(league:League) {
        leagueRepo?.addFavourite(league: league)
    }
    
    
    private var view:LeaguesView?
    private var leagueRepo:LeagueRepoProtocol?
    
    init(leagueRepo:LeagueRepoProtocol) {
        self.leagueRepo = leagueRepo
    }
    
    func attachView(view: LeaguesView) {
        self.view = view
    }
    
    func dettachView() {
        self.view = nil
    }
    
    func removeFavourite(idLeague: String) {
        if let result = leagueRepo?.deleteFavourite(leagueId: idLeague),result{
            self.view?.removeFavorite(idLeague: idLeague)
        }else{
            self.view?.showError(message: "Sorry, Favourite cannot be deleted.")
        }
    }
    
    func getAllLeagues(sportTitle:String) {
        if Reachability.isConnectedToNetwork(){
            self.view?.startLoading()
            leagueRepo?.getLeagues(sportTitle: "Soccer", completion: { (response) in
                switch (response.status!){
                case .success:
                    if let leagueItems = response.data?.countrys,
                       !leagueItems.isEmpty{
                        self.view?.setLeagues(leagues: leagueItems)
                    }else{
                        self.view?.setEmptyLeagues()
                    }
                    
                case .failure:
                    self.view?.setEmptyLeagues()
                }
            })
        }else{
            self.view?.showNoInternet()
        }
        }
    
    
    
        
    
    
    
}
