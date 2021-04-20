//
//  MovieRemoteDataSource.swift
//  SportRemoteDataSource
//
//  Created by Yasmine Ghazy on 05/04/2021.
//  Copyright © 2021 Yasmine Ghazy. All rights reserved.
//

import Foundation

class SportRemoteDataSource: SportDataSource {
    
    //MARK: - Properties
    private let baseUrl = "https://www.thesportsdb.com/api/v1/json/1/"

    func getSports(completion: @escaping ResponseHandler<Sports>) {
        let url = baseUrl + "all_sports.php"
        RequestHandler.shared.get(url: url, completion: completion)
    }
    
    func getLeagues(sportTitle: String,completion: @escaping ResponseHandler<Leagues>) {
        let url = baseUrl + "search_all_leagues.php?s=Soccer"
        RequestHandler.shared.get(url: url, completion: completion)
    }
    
    func getTeams(leagueId: String, completion: @escaping ResponseHandler<Teams>){
        let url = baseUrl + "lookup_all_teams.php?id=\(leagueId)"
        RequestHandler.shared.get(url: url, completion: completion)
    }
    
    func getLatestResults(leagueId: String, completion: @escaping ResponseHandler<Results>){
        let url = baseUrl + "eventslast.php?id=\(leagueId)"
        RequestHandler.shared.get(url: url, completion: completion)
    }
    
    func getUpcomingEvents(leagueId: String, completion: @escaping ResponseHandler<Events>){
        let url = baseUrl + "eventsround.php?id=\(leagueId)&r=33&s=2020-2021"
        RequestHandler.shared.get(url: url, completion: completion)
    }

}
