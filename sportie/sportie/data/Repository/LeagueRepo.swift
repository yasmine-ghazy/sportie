//
//  DBManager.swift
//  Day4
//
//  Created by Yasmine Ghazy on 04/04/2021.
//  Copyright © 2021 Yasmine Ghazy. All rights reserved.
//

import Foundation

protocol LeagueRepoProtocol{
    func getLeagues(sportTitle: String, completion: @escaping ((Response<Leagues>) -> ()))
    func addFavourite(league: League) -> Bool
    func deleteFavourite(leagueId: String) -> Bool
    func getFavouriteLeagues() -> [League]
    func deleteAllLeagues() -> Bool
}

class LeagueRepo: LeagueRepoProtocol {

    //MARK: - Properties
    var sportDataSource: SportDataSource!
    var favoriteDataSource: FavoriteDataSource!
    
    //MARK: - Initializer
    init(sportDataSource: SportDataSource, favoriteDataSource: FavoriteDataSource){
        self.sportDataSource = sportDataSource
        self.favoriteDataSource = favoriteDataSource
    }
    
    //MARK: - LeagueRepoProtocol
    func getLeagues(sportTitle: String, completion: @escaping ResponseHandler<Leagues>){
        sportDataSource.getLeagues(sportTitle: sportTitle, completion: completion)
    }
    
    func addFavourite(league: League) -> Bool{
        favoriteDataSource.addFavourite(league: league)
    }
    
    func deleteFavourite(leagueId: String) -> Bool{
        favoriteDataSource.deleteFavourite(leagueId: leagueId)
    }
    
    func getFavouriteLeagues() -> [League]{
        return favoriteDataSource.getFavouriteLeagues()
    }
    
    func deleteAllLeagues() -> Bool{
        return favoriteDataSource.deleteAllLeagues()
    }
    
}
