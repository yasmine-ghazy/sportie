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
        eventDateLabel.text = UIHelper.formatedDate(isoDate: item.strTimestamp, format: "dd\nMMM")
        eventTimeLabel.text = UIHelper.formatedDate(isoDate: item.strTimestamp, format: "mm:ss\na")
    }
}
