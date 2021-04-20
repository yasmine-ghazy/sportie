//
//  Team.swift
//  sportie
//
//  Created by Yasmine Ghazy on 18/04/2021.
//

import Foundation
import Foundation

struct Teams: Codable{
    var teams : [Team]!
}

struct Team: Codable{
    
    var idTeam : String!
    
    //Images
    var strTeamBadge : String!
    
    //Team Details
    var strTeam : String!
    
    var intFormedYear : String!
    var strCountry : String!
    var strDescriptionEN : String!
    var strManager : String!
    
    //Stadium
    var strStadium : String!
    var strStadiumThumb : String!

    //Social
    var strFacebook : String!
    var strInstagram : String!
    var strTwitter : String!
    var strWebsite : String!
    var strYoutube : String!
}


/*
 List All teams details in a league by Id
 https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id=4328
*/


/*
 Team Details by Id
 https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id=133604
*/
