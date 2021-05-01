//
//  FavButton.swift
//  sportie
//
//  Created by Yasmine Ghazy on 01/05/2021.
//

import UIKit

@IBDesignable public class FavButton: UIButton {

    override public func layoutSubviews() {
        super.layoutSubviews()
        
        self.setImage(UIImage(systemName: "heart"), for: .normal)
        self.setImage(UIImage(systemName: "heart.fill"), for: .selected)
    }
    
    func toggle(){
        self.isSelected.toggle()
    }
    
    func setFaved(_ isFaved: Bool){
        self.isSelected = isFaved
    }
}
