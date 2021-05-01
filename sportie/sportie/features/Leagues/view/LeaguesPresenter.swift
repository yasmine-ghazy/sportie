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
    
    func setLeagues(leagues:[League])
    func setEmptyLeagues()
    
    func makeFavorite(league:League)
    
    func openYoutube(url: String)
   
    func goToLeagueDetails(league: League)
    func showError(message: String)
 
}

protocol LeaguesPresenterProtocol {
    func attachView(view: LeaguesView)
    func dettachView()
    func getAllLeagues(sportTitle:String)
    func leagueSelected(league: League)
    func favSelected(league: League)
    func youtubeSelected(url: String)
}

class LeaguesPresenter:LeaguesPresenterProtocol{
    
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

    
    func getAllLeagues(sportTitle:String) {
        
        guard let favoriteLeagues = leagueRepo?.getFavouriteLeagues() else{return}
        let favIds = favoriteLeagues.map { $0.idLeague}
        
        if Reachability.isConnectedToNetwork(){
            self.view?.startLoading()
            leagueRepo?.getLeagues(sportTitle: sportTitle, completion: { (response) in
                self.view?.finishLoading()
                switch (response.status!){
                case .success:
                    if let leagueItems = response.data?.countrys,
                       !leagueItems.isEmpty{
                        var items = Array(leagueItems)
                        for i in 0..<items.count{
                            items[i].isFav =  favIds.contains(items[i].idLeague)
                        }
                        self.view?.setLeagues(leagues: items)
                    }else{
                        self.view?.setEmptyLeagues()
                    }
                    
                case .failure:
                    self.view?.setEmptyLeagues()
                }
            })
        }else{
            self.view?.showNoInternet()
            self.view?.setEmptyLeagues()
        }
    }
    
    
    func leagueSelected(league: League) {
        if(Reachability.isConnectedToNetwork()){
            self.view?.goToLeagueDetails(league: league)
        }else{
            self.view?.showNoInternet()
        }
    }
    
    
    func youtubeSelected(url: String) {
        self.view?.openYoutube(url: url)
    }
    
    func favSelected(league: League) {
        if league.isFav{
            if let result = leagueRepo?.deleteFavourite(leagueId: league.idLeague),result{
                self.view?.makeFavorite(league: league)
            }else{
                self.view?.showError(message: "Sorry, Favourite cannot be deleted.")
            }
            
        }else{
            if let result = leagueRepo?.addFavourite(league: league),result{
                self.view?.makeFavorite(league: league)
            }else{
                self.view?.showError(message: "Sorry, Favourite cannot be added.")
            }
        }
    }

}
