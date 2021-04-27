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
    @IBOutlet weak var youtubeButton: UIButton!
    @IBOutlet weak var roundView: UIView!
    
    //MARK: - Properties
    static let reuseIdentifier = "LeagueTableViewCell"
    var favAction: (()->())?
    var youtubeAction: (()->())?
    
    
    //MARK: - IBAction
    @IBAction func favClicked(_ sender: Any) {
        favAction?()
    }
    
    @IBAction func youtubeClicked(_ sender: Any) {
        youtubeAction?()
    }
    
    //MARK: - LifeCycle
    
    //MARK: - Methods
    func configureData(item: League){
        titleLabel?.text = item.strLeague
        
        favButton?.setImage(UIImage(systemName: "heart"), for: .normal)
        favButton?.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        favButton.isSelected = item.isFav ?? false
        
        if let youtube = item.strYoutube{
            youtubeButton.isHidden = youtube.isEmpty
        }
        
//        movieIV.kf.setImage(with: URL(string: item.strBadge)) { (_, _, _, _) in
//            self.roundView.layer.cornerRadius = self.roundView.frame.height / 2.0
//            self.roundView.layer.masksToBounds = true
//        }
        
        movieIV.setImage(urlString: item.strBadge){
            self.roundView.layer.cornerRadius = self.roundView.frame.height / 2.0
            self.roundView.layer.masksToBounds = true
        }
    }
}
