//
//  UIImageView+Extension.swift
//  Day7
//
//  Created by Yasmine Ghazy on 11/04/2021.
//

import UIKit
import Kingfisher

extension UIImageView{
    func setImage(urlString: String, completion: @escaping (()->())){
        let url = URL(string: urlString)
            let processor = DownsamplingImageProcessor(size: self.bounds.size)
            self.kf.indicatorType = .activity
            self.kf.setImage(
                with: url,
                placeholder: UIImage(named: "placeholder"),
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ]) { (_, _, _, _) in
                completion()
            }
    }
    
}


