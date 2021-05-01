//
//  RoundedImageView.swift
//  sportie
//
//  Created by Yasmine Ghazy on 28/04/2021.
//

import UIKit

@IBDesignable public class CircleView: UIView {

    override public func layoutSubviews() {
        super.layoutSubviews()

        //hard-coded this since it's always round
        layer.cornerRadius = 0.5 * bounds.size.width
    }
}
