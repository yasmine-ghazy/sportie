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
        eventNameLabel.text = item.strEvent
        if let strTimestamp = item.strTimestamp{
            eventDateLabel.text = UIHelper.formatedDate(isoDate: strTimestamp, format: "dd\nMMM") ?? item.strTime
            eventTimeLabel.text = UIHelper.formatedDate(isoDate: strTimestamp, format: "mm:ss\na") ?? item.dateEvent
        }else{
            eventDateLabel.text = item.strTime
            eventTimeLabel.text = item.dateEvent
        }
        
    }
}
