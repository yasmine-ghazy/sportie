//
//  MovieRemoteDataSource.swift
//  Day5
//
//  Created by Yasmine Ghazy on 05/04/2021.
//  Copyright © 2021 Yasmine Ghazy. All rights reserved.
//

import Foundation

class SportRemoteDataSource: SportDataSource {
    
    //MARK: - Properties
    static let shared: SportDataSource = SportRemoteDataSource()
    
    let baseUrl = "https://www.thesportsdb.com/api/v1/json/1/"
    
    private init(){
        
    }
    
    func getSports(completion: @escaping ((Response) -> ())) {
        let url = baseUrl + "all_sports.php"
        completion(Response())
    }
    
    func getLeagues(sportTitle: String,completion: @escaping ((Response) -> ())) {
        let url = baseUrl + "all_leagues.php?s=\(sportTitle)"
        
        completion(Response())
    }
    
    func getTeams(leagueId: String, completion: @escaping ((Response) -> ())){
        let url = baseUrl + "lookup_all_teams.php?id=\(leagueId)"
        
        completion(Response())
    }
    
    func getLeagueDetails(leagueId: String, completion: @escaping ((Response) -> ())) {
        let url = baseUrl + "lookupleague.php?id=\(leagueId)"
        completion(Response())
    }
    
    func getLatestResults(teamId: String, completion: @escaping ((Response) -> ())){
        let url = baseUrl + "eventslast.php?id=\(teamId)"
        completion(Response())
    }
    
    func getUpcomingEvents(teamId: String, completion: @escaping ((Response) -> ())){
        let url = baseUrl + "eventsround.php?id=\(teamId)&r=33&s=2020-2021"
        completion(Response())
    }

}
