//
//  Sport.swift
//  sportie
//
//  Created by Yasmine Ghazy on 18/04/2021.
//

import Foundation

struct Sports: Codable{
    var sports : [Sport]!
}

struct Sport: Codable{
    var strSport : String!
    var strSportThumb : String!
}

//https://www.thesportsdb.com/api/v1/json/1/all_sports.php


/*
List all Teams in a League
https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=English%20Premier%20League
https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?s=Soccer&c=Spain
*/
