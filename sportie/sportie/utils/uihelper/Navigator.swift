//
//  Navigator.swift
//  Day4
//
//  Created by Yasmine Ghazy on 04/04/2021.
//  Copyright © 2021 Yasmine Ghazy. All rights reserved.
//

import UIKit

class Navigator {
   //Singelton Object
    static let shared = Navigator()
    private init() {}
    
    //Instance Methods
    func goToLeagueDetails(with item: League, from srcVC: UIViewController) {
        let dstVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LeagueDetailsViewController") as LeagueDetailsViewController
        dstVc.item = item
        srcVC.present(dstVc, animated: true, completion: nil)
    }
    
    func goToTeamDetails(with item: Team, from srcVC: UIViewController) {
        let dstVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TeamDetailsViewController") as TeamDetailsViewController
        dstVc.item = item
        srcVC.present(dstVc, animated: true, completion: nil)
    }
    
    func gotoLeagues(sportId:String,from srcVC: UIViewController){
        let dstVc = UIStoryboard(name:"Main",bundle: nil).instantiateViewController(identifier: "LeaguesTableViewController") as LeaguesTableViewController
            dstVc.sportTitle = sportId
        srcVC.navigationController?.pushViewController(dstVc, animated: true)
        
    }
}
