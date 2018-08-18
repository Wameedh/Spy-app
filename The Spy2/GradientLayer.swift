//
//  CAGradientLayer+Convience.swift
//  GradientBackground
//
//  Created by Dave Green on 17/12/2014.
//  Copyright (c) 2014 DeveloperDave. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    func gradientColor(topColor: UIColor, bottomColor: UIColor, location: Float) -> CAGradientLayer {
        
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0, location]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]
        
        return gradientLayer
    }
}

func gradientLayer(view: UIView, topColor: UIColor, bottomColor: UIColor,  location: Float){
    let background = CAGradientLayer().gradientColor(topColor: topColor, bottomColor: bottomColor, location: location)
    background.frame = view.bounds
    view.layer.insertSublayer(background, at: 0)
}
