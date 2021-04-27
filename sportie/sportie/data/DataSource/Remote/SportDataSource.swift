//
//  MovieDataSourceInterface.swift
//  Day5
//
//  Created by Yasmine Ghazy on 05/04/2021.
//  Copyright © 2021 Yasmine Ghazy. All rights reserved.
//

import Foundation

protocol SportDataSource {
    
    func getSports(completion: @escaping ((Response<Sports>) -> ()))
    
    func getLeagues(sportTitle: String,completion: @escaping ((Response<Leagues>) -> ()))
    
    func getTeams(leagueId: String, completion: @escaping ((Response<Teams>) -> ()))
        
    func getLatestResults(leagueId: String, completion: @escaping ((Response<Events>) -> ()))
    
    func getUpcomingEvents(leagueId: String, roundNumber: String, season: String, completion: @escaping ((Response<Events>) -> ()))
}

