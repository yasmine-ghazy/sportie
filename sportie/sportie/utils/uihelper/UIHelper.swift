//
//  UIHelper.swift
//  Day5
//
//  Created by Yasmine Ghazy on 07/04/2021.
//  Copyright © 2021 Yasmine Ghazy. All rights reserved.
//

import UIKit

class UIHelper {
    
    class func showAlert(at vc: UIViewController, title: String? = nil, message: String, handler: (()->())? = nil){
       let alert = UIAlertController(title: title , message: message, preferredStyle: UIAlertController.Style.alert)
        alert.view.tintColor = #colorLiteral(red: 0.8170323968, green: 0.1220784113, blue: 0, alpha: 1)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default){ _ in
            handler?()
        })
        vc.present(alert, animated: true, completion: nil)
    }
    
    class func openURL(url: String){
        if let url = URL(string: "http://\(url)"){
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    class func formatedDate(isoDate: String , format: String)-> String?{
        let inputDateFormatter = ISO8601DateFormatter()
        
        if let date = inputDateFormatter.date(from:isoDate){
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = format
            return outputDateFormatter.string(from: date)
        }
        
        return nil
    }
 
}
