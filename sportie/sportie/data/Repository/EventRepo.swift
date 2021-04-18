//
//  EventRepo.swift
//  sportie
//
//  Created by Yasmine Ghazy on 18/04/2021.
//

import Foundation

protocol EventRepoProtocol{
    func getTeams(leagueId: String, completion: @escaping ((Response) -> ()))
    func getLatestResults(teamId: String, completion: @escaping ((Response) -> ()))
    func getUpcomingEvents(teamId: String, completion: @escaping ((Response) -> ()))
}

class EventRepo: EventRepoProtocol {
    
    var sportDataSource: SportDataSource!
    
    init(sportDataSource: SportDataSource){
        self.sportDataSource = sportDataSource
    }
    
    func getTeams(leagueId: String, completion: @escaping ((Response) -> ())){
        sportDataSource.getTeams(leagueId: leagueId, completion: completion)
    }
    
    func getLatestResults(teamId: String, completion: @escaping ((Response) -> ())){
        sportDataSource.getLatestResults(teamId: teamId, completion: completion)
    }
    
    func getUpcomingEvents(teamId: String, completion: @escaping ((Response) -> ())){
        sportDataSource.getUpcomingEvents(teamId: teamId, completion: completion)
    }
    
}
