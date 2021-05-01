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
    @IBOutlet weak var favButton: FavButton!
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
        
        favButton.setFaved(item.isFav ?? false)
        
        if let youtube = item.strYoutube{
            youtubeButton.isHidden = youtube.isEmpty
        }
        if let badge = item.strBadge{
            movieIV.setImage(urlString: badge, placeholder:  UIImage(systemName: "photo.on.rectangle.angled")!)
        }else{
            movieIV.image = UIImage(systemName: "photo.on.rectangle.angled")!
        }
        
    }
}
