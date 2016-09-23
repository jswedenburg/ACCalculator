//
//  RadialGradientLayer.swift
//  ACCalculator
//
//  Created by Jake SWEDENBURG on 9/22/16.
//  Copyright © 2016 Jake Swedenbug. All rights reserved.
//

import Foundation
import UIKit

class RadialGradientLayer: CALayer {
    
    init(innerColor: UIColor, outerColor: UIColor) {
        self.innerColor = innerColor.cgColor
        self.outerColor = outerColor.cgColor
        
        super.init()
        
        needsDisplayOnBoundsChange = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    var innerColor: CGColor
    var outerColor: CGColor
    
    
    
    override func draw(in ctx: CGContext) {
        ctx.saveGState()
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let locations:[CGFloat] = [0.0, 1.0]
        let colors = [innerColor, outerColor]
        

        
       let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations)
        
        let center = CGPoint(x: bounds.width / 2.0, y: bounds.height / 2.0)
        let radius = min(bounds.width / 2.0, bounds.height / 2.0)
        
        
        ctx.drawRadialGradient(gradient!, startCenter: center, startRadius: radius, endCenter: center, endRadius: radius, options: .drawsAfterEndLocation)
        
        
        
        }
}

