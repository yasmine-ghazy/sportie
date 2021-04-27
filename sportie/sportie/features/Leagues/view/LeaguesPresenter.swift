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
//    func getFavoriteLeagues()
    func makeFavorite(league:League)
    
}

class LeaguesPresenter:LeaguesPresenterProtocol{

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
        }
    }
    
    
    
        
    
    
    
}
