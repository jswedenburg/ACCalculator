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
    
    override init() {
        super.init()
        needsDisplayOnBoundsChange = true
    }
    
    init(center: CGPoint, radius: CGFloat, colors: [CGColor]) {
        self.center = center
        self.radius = radius
        self.colors = colors
        super.init()    }
    
    required init(coder aDecoder: NSCoder) {
         super.init()
    }
    
    var center:CGPoint = CGPoint(x: 50, y: 50)
    var radius:CGFloat = 20
    var colors:[CGColor] = [UIColor(red: 251/255, green: 237/255, blue: 33/255, alpha: 1.0).cgColor , UIColor(red: 251/255, green: 179/255, blue: 108/255, alpha: 1.0).cgColor]
    
    override func draw(in ctx: CGContext) {
        ctx.saveGState()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let locations: [CGFloat] = [0.0, 1.0]
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations)
        ctx.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: radius, options: .drawsAfterEndLocation)
    }
}

