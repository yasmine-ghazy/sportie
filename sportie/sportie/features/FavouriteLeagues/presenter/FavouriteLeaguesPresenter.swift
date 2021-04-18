//
//  FavouriteLeaguesPresenter.swift
//  sportie
//
//  Created by Yasmine Ghazy on 18/04/2021.
//

import Foundation

protocol FavouriteLeaguesView{
    func showFavouriteLeagues(items: [League])
    func favouriteLeagueDeleted()
}

class FavouriteLeaguesPresenter{
    
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
        if let items = repo?.getFavouriteLeagues(){
            self.view?.showFavouriteLeagues(items: items)
        }
    }
    
    func removeFavouriteLeague(){
//        if true {
//            self.view?.favouriteLeagueRemoved()
//        }
    }
    
}
