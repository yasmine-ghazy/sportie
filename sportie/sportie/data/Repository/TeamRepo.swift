//
//  TeamRepo.swift
//  sportie
//
//  Created by Yasmine Ghazy on 18/04/2021.
//

import Foundation


protocol TeamRepoProtocol{
    func getTeams(leagueId: String, completion: @escaping ((Response) -> ()))
}

class TeamRepo: TeamRepoProtocol {
    
    var sportDataSource: SportDataSource!
    
    init(sportDataSource: SportDataSource){
        self.sportDataSource = sportDataSource
    }
    
    func getTeams(leagueId: String, completion: @escaping ((Response) -> ())){
        sportDataSource.getTeams(leagueId: leagueId, completion: completion)
    }
    
}
