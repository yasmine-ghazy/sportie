//
//  CustomView.swift
//  sportie
//
//  Created by Yasmine Ghazy on 19/04/2021.
//

import UIKit

extension UIView {

    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor.init(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {

            layer.shadowRadius = shadowRadius
        }
    }
    @IBInspectable
    var shadowOffset : CGSize{

        get{
            return layer.shadowOffset
        }set{

            layer.shadowOffset = newValue
        }
    }

    @IBInspectable
    var shadowColor : UIColor{
        get{
            return UIColor.init(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    @IBInspectable
    var shadowOpacity : Float {

        get{
            return layer.shadowOpacity
        }
        set {

            layer.shadowOpacity = newValue

        }
    }

    
    @IBInspectable
    var roundTop: CGFloat {
        get{
            return layer.cornerRadius
        }
        set {
            roundTop(radius: newValue)
        }
    }
    
    func roundTop(radius: CGFloat = 5){
        round(radius: radius, maskedCorners: [.layerMaxXMinYCorner, .layerMinXMinYCorner])
     }

     func roundBottom(radius:CGFloat = 5){
        round(radius: radius, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner])
     }

    func round(radius:CGFloat = 5, maskedCorners: CACornerMask){
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = maskedCorners
    }
}
