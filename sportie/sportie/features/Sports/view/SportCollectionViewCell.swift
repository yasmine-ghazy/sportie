//
//  MovieCollectionViewCell.swift
//  Day4
//
//  Created by Yasmine Ghazy on 04/04/2021.
//  Copyright © 2021 Yasmine Ghazy. All rights reserved.
//

import UIKit
import Kingfisher

class SportCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var sportIV: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Properties
    static let reuseIdentifier = "SportCollectionViewCell"
    
    //MARK: - IBAction
    
    //MARK: - Methods
    func configureData(item: Sport){
        titleLabel?.text = item.strSport
        sportIV.kf.setImage(with: URL(string:item.strSportThumb))
    }
}
