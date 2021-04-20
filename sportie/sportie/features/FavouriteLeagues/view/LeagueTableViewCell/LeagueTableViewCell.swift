//
//  MovieTVC.swift
//  Day4
//
//  Created by Yasmine Ghazy on 04/04/2021.
//  Copyright © 2021 Yasmine Ghazy. All rights reserved.
//

import UIKit
import Kingfisher

class LeagueTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var movieIV: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    //MARK: - Properties
    static let reuseIdentifier = "LeagueTableViewCell"
    var favAction: (()->())?
    
    
    //MARK: - IBAction
    @IBAction func favClicked(_ sender: Any) {
        favAction?()
    }
    
    //MARK: - LifeCycle
    
    //MARK: - Methods
    func configureData(item: League){
        titleLabel?.text = item.strLeague
        movieIV.setImage(urlString: item.strBadge)
        favButton?.setImage(UIImage(systemName: "heart"), for: .normal)
        favButton?.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        favButton.isSelected = item.isFav ?? false
    }
}
