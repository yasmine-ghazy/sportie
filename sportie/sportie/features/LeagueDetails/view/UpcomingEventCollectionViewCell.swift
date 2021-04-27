//
//  UpcomingEventCollectionViewCell.swift
//  sportie
//
//  Created by Yasmine Ghazy on 22/04/2021.
//

import UIKit

class UpcomingEventCollectionViewCell: UICollectionViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    
    //MARK: - Properties
    static let reuseIdentifier = "UpcomingEventCollectionViewCell"
    
    //MARK: - IBAction
    
    //MARK: - Methods
    func configureData(item: Event){
        eventNameLabel.text = item.strHomeTeam + "\nvs\n" + item.strAwayTeam
        eventDateLabel.text = formatedDate(isoDate: item.strTimestamp, format: "dd\nMMM")
        eventTimeLabel.text = formatedDate(isoDate: item.strTimestamp, format: "mm:ss\na")
    }
    
    func formatedDate(isoDate: String, format: String)-> String{
        let inputDateFormatter = ISO8601DateFormatter()
        let date = inputDateFormatter.date(from:isoDate)!
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = format
        return outputDateFormatter.string(from: date)
        
    }
    
    
    
}
