//
//  UIHelper.swift
//  Day5
//
//  Created by Yasmine Ghazy on 07/04/2021.
//  Copyright © 2021 Yasmine Ghazy. All rights reserved.
//

import UIKit

class UIHelper {
    
    //Singelton Object
    static let shared = UIHelper()
    private init(){}
    
    func showAlert(at vc: UIViewController, title: String? = nil, message: String, handler: (()->())? = nil){
       let alert = UIAlertController(title: title , message: message, preferredStyle: UIAlertController.Style.alert)
        alert.view.tintColor = #colorLiteral(red: 0.8170323968, green: 0.1220784113, blue: 0, alpha: 1)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default){ _ in
            handler?()
        })
        vc.present(alert, animated: true, completion: nil)
    }
 
}
