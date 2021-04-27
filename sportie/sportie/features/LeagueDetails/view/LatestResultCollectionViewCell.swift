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
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var awayTeamScoreLabel: UILabel!
    
    //MARK: - Properties
    static let reuseIdentifier = "LatestResultCollectionViewCell"
    
    //MARK: - IBAction
    
    //MARK: - Methods
    func configureData(item: Event){
        homeTeamLabel.text = item.strHomeTeam
        awayTeamLabel.text = item.strAwayTeam
        homeTeamScoreLabel.text = item.intHomeScore
        awayTeamScoreLabel.text = item.intAwayScore
        
        eventDateLabel.text = UIHelper.formatedDate(isoDate: item.strTimestamp, format: "dd MMM")
        eventTimeLabel.text = UIHelper.formatedDate(isoDate: item.strTimestamp, format: "mm:ss a")
    }
    

    
    
    
}
