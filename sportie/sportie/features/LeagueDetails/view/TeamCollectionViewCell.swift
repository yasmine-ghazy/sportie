//
//  TeamCollectionViewCell.swift
//  sportie
//
//  Created by Yasmine Ghazy on 22/04/2021.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var teamIV: UIImageView!
    @IBOutlet weak var roundView: UIView!

    
    //MARK: - Properties
    static let reuseIdentifier = "TeamCollectionViewCell"
    
    //MARK: - IBAction
    
    //MARK: - Methods
    func configureData(item: Team){
        teamIV.kf.setImage(with: URL(string: item.strTeamBadge)) { (_, _, _, _) in
            self.roundView.layer.cornerRadius = self.roundView.frame.height / 2.0
            self.roundView.layer.masksToBounds = true
        }
    }
}
