//
//  FavouriteLeaguesPresenter.swift
//  sportie
//
//  Created by Yasmine Ghazy on 18/04/2021.
//

import Foundation

protocol FavouriteLeaguesView{
    func setFavourites(leagues: [League])
    func setEmptyFavourites()
    
    func favouriteDeleted(leagueId: String)
    
    func openYoutube(url: String)
    
    func goToLeagueDetails(league: League)
    
    func showError(message: String)
    
    func showNoInternet()
}

protocol FavouriteLeaguesPresenterProtocol {
    func attachView(view: FavouriteLeaguesView)
    func dettachView()
    func getFavouriteLeagues()
    func leagueSelected(league: League)
    func deleteFavourite(leagueId: String)
    func youtubeSelected(url: String)
}

class FavouriteLeaguesPresenter: FavouriteLeaguesPresenterProtocol{

    var view: FavouriteLeaguesView?
    private let repo: LeagueRepoProtocol?
    
    init(repo: LeagueRepoProtocol){
        self.repo = repo
    }
    
    func attachView(view: FavouriteLeaguesView){
        self.view = view
    }
    
    func dettachView(){
        self.view = nil
    }
    
    func getFavouriteLeagues(){
        if let items = repo?.getFavouriteLeagues(), !items.isEmpty{
            self.view?.setFavourites(leagues: items)
        }else{
            self.view?.setEmptyFavourites()
        }

    }
    
    func deleteFavourite(leagueId: String) {
        if let res = repo?.deleteFavourite(leagueId: leagueId), res{
            self.view?.favouriteDeleted(leagueId: leagueId)
        }else{
            self.view?.showError(message: "Sorry, Favourite cannot be deleted.")
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
    
    
    
}
