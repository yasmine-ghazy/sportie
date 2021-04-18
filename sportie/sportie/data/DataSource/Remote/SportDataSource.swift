//
//  MovieDataSourceInterface.swift
//  Day5
//
//  Created by Yasmine Ghazy on 05/04/2021.
//  Copyright © 2021 Yasmine Ghazy. All rights reserved.
//

import Foundation

protocol SportDataSource {
    
    func getSports(completion: @escaping ((Response) -> ()))
    
    func getLeagues(sportTitle: String,completion: @escaping ((Response) -> ()))
    
    func getTeams(leagueId: String, completion: @escaping ((Response) -> ()))
    
    func getLeagueDetails(leagueId: String, completion: @escaping ((Response) -> ()))
    
    func getLatestResults(teamId: String, completion: @escaping ((Response) -> ()))
    
    func getUpcomingEvents(teamId: String, completion: @escaping ((Response) -> ()))
    
}

