//
//  Event.swift
//  sportie
//
//  Created by Yasmine Ghazy on 18/04/2021.
//

import Foundation

import Foundation

struct Event{
    //Properties
    var idEvent : String!
    
    //event name
    var strEvent : String!
    
    var strHomeTeam : String!
    var strAwayTeam : String!
    
    //score
    var intHomeScore : String!
    var intAwayScore : String!
    
    //date and time
    var strTimestamp : String!
    
    var strTime : String!
    var strTimeLocal : String!
    var dateEvent : String!
    var dateEventLocal : String!
    
    //thumb
    var strThumb : String!
}

/*Last 5 Events by Team Id
 (Limited to home team for free tier) https://www.thesportsdb.com/api/v1/json/1/eventslast.php?id=133602*/
