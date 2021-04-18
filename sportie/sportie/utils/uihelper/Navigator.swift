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
    func goToLeagueDetails(with item: Movie, from srcVC: UIViewController) {
        let dstVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LeagueDetailsViewController ") as LeagueDetailsViewController
        dstVc.item = item
        srcVC.present(dstVc, animated: true, completion: nil)
    }
    
    
    func goToTeamDetails(with item: Movie, from srcVC: UIViewController) {
//        let dstVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TeamDetailsViewController ") as TeamDetailsViewController
//        dstVc.item = item
//        srcVC.present(dstVc, animated: true, completion: nil)
    }
}
