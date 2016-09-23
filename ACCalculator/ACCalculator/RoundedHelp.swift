//
//  FloatExtension.swift
//  ACCalculator
//
//  Created by Jake SWEDENBURG on 9/23/16.
//  Copyright © 2016 Jake Swedenbug. All rights reserved.
//

import Foundation

extension Float {
    
    func roundTo(places:Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
    
}
