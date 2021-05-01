//
//  NoInternetView.swift
//  Jadee
//
//  Created by Yasmine Ghazy on 3/16/20.
//  Copyright © 2020 Yasmine Ghazy. All rights reserved.
//

import UIKit

class CustomView: UIView {

    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Properties
    
    //MARK: - View Initializer
    class func create(image: UIImage, title: String) -> CustomView {
        let nib = UINib(nibName: "CustomView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CustomView
        nib.configure(image: image, title: title)
        return nib
    }
    
    //MARK: - Methods
    
    /**
     This method set the data in the views to be displayed.
     - Parameter item: item details data.
     */
    func configure(image: UIImage, title: String){
        self.imageView.image = image
        titleLabel.text = title
    }

}
