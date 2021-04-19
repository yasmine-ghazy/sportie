//
//  SportRepo.swift
//  sportie
//
//  Created by Yasmine Ghazy on 18/04/2021.
//

import Foundation


protocol SportRepoProtocol{
    func getSports(completion: @escaping ResponseHandler<Sports>)
}

class SportRepo: SportRepoProtocol {
    
    var sportDataSource: SportDataSource!
    
    init(sportDataSource: SportDataSource){
        self.sportDataSource = sportDataSource
    }
    
    func getSports(completion: @escaping ResponseHandler<Sports>){
        sportDataSource.getSports(completion: completion)
    }
    
}
