//
//  FavouriteDataSource.swift
//  sportie
//
//  Created by Yasmine Ghazy on 18/04/2021.
//

import Foundation

protocol FavoriteDataSource {
    func addFavourite(league: League) -> Bool
    func deleteFavourite(leagueId: String) -> Bool
    func getFavouriteLeagues() -> [League]
    func deleteAllLeagues() -> Bool
}
