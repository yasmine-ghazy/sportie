//
//  EventRepo.swift
//  sportie
//
//  Created by Yasmine Ghazy on 18/04/2021.
//

import Foundation

protocol EventRepoProtocol{
    func getTeams(leagueId: String, completion: @escaping ResponseHandler<Teams>)
    func getLatestResults(leagueId: String, completion: @escaping ResponseHandler<Events>)
    func getUpcomingEvents(leagueId: String, completion: @escaping ResponseHandler<Events>)
}

class EventRepo: EventRepoProtocol {
    
    var sportDataSource: SportDataSource!
    
    init(sportDataSource: SportDataSource){
        self.sportDataSource = sportDataSource
    }
    
    func getTeams(leagueId: String, completion: @escaping ResponseHandler<Teams>){
        sportDataSource.getTeams(leagueId: leagueId, completion: completion)
    }
    
    func getLatestResults(leagueId teamId: String, completion: @escaping ResponseHandler<Events>){
        sportDataSource.getLatestResults(leagueId: teamId, completion: completion)
    }
    
    func getUpcomingEvents(leagueId teamId: String, completion: @escaping ResponseHandler<Events>){
        sportDataSource.getUpcomingEvents(leagueId: teamId, completion: completion)
    }
    
}
