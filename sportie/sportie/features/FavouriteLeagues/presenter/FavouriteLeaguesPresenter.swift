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
    func showError(message: String)
}

protocol FavouriteLeaguesPresenterProtocol {
    func attachView(view: FavouriteLeaguesView)
    func dettachView()
    func getFavouriteLeagues()
    func deleteFavourite(leagueId: String)
    func getIndex(for leagueId: String, in itemsList: [League])-> Int?
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
    
    func getIndex(for leagueId: String, in itemsList: [League])-> Int?{
        for i in 0..<itemsList.count{
            if(itemsList[i].idLeague == leagueId){
                return i
            }
        }
        return nil
    }
    
}
