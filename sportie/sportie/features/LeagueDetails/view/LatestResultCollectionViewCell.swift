//
//  LatestResultsCollectionViewCell.swift
//  sportie
//
//  Created by Yasmine Ghazy on 26/04/2021.
//

import UIKit

class LatestResultCollectionViewCell: UICollectionViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var teamsLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var awayTeamScoreLabel: UILabel!
    
    //MARK: - Properties
    static let reuseIdentifier = "LatestResultCollectionViewCell"
    
    //MARK: - IBAction
    
    //MARK: - Methods
    func configureData(item: Event){
        teamsLabel.text = item.strEvent
        homeTeamScoreLabel.text = item.intHomeScore
        awayTeamScoreLabel.text = item.intAwayScore
        
        if let strTimestamp = item.strTimestamp{
            eventDateLabel.text = UIHelper.formatedDate(isoDate: strTimestamp, format: "dd MMM, mm:ss a")
        }

        if let intHomeScore = item.intHomeScore, let intAwayScore = item.intAwayScore{
            if intHomeScore > intAwayScore{
                homeTeamScoreLabel.textColor = #colorLiteral(red: 0, green: 0.61919415, blue: 0.3053342104, alpha: 1)
                awayTeamScoreLabel.textColor = #colorLiteral(red: 0.902534306, green: 0.1283575892, blue: 0, alpha: 1)
            }else if  intHomeScore < intAwayScore{
                homeTeamScoreLabel.textColor = #colorLiteral(red: 0.902534306, green: 0.1283575892, blue: 0, alpha: 1)
                awayTeamScoreLabel.textColor = #colorLiteral(red: 0, green: 0.61919415, blue: 0.3053342104, alpha: 1)
            }else{
                homeTeamScoreLabel.textColor = #colorLiteral(red: 0.8912442923, green: 0.625772357, blue: 0, alpha: 1)
                awayTeamScoreLabel.textColor = #colorLiteral(red: 0.8912442923, green: 0.625772357, blue: 0, alpha: 1)
            }
        }
        
    }
    

    
    
    
}
