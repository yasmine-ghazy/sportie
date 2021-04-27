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
        
        eventDateLabel.text = formatedDate(isoDate: item.strTimestamp, format: "dd MMM")
        eventTimeLabel.text = formatedDate(isoDate: item.strTimestamp, format: "mm:ss a")
    }
    
    func formatedDate(isoDate: String, format: String)-> String{
        let inputDateFormatter = ISO8601DateFormatter()
        let date = inputDateFormatter.date(from:isoDate)!
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = format
        return outputDateFormatter.string(from: date)
        
    }
    
    
    
}
