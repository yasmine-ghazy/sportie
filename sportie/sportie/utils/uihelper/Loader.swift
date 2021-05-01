//
//  Loader.swift
//  Day5
//
//  Created by Yasmine Ghazy on 07/04/2021.
//  Copyright © 2021 Yasmine Ghazy. All rights reserved.
//

import UIKit

class Loader{
    
    //Singelton
    static let shared = Loader()
    private init(){
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor(named: "AccentColor")
        // In most cases this will be set to true, so the indicator hides when it stops spinning
        activityIndicator.hidesWhenStopped = true
    }
    
    //MARK: - Property
    private let activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Methods
    func start(from view: UIView){
        // Place the activity indicator on the center of your current screen
        activityIndicator.center = view.center.applying(CGAffineTransform(translationX: 0, y: 0))
        view.addSubview(activityIndicator)
        // Start the activity indicator and place it onto your view
        activityIndicator.startAnimating()
    }

    func stop(){
        // Finally after the job above is done, stop the activity indicator
        activityIndicator.stopAnimating()
    }

}
