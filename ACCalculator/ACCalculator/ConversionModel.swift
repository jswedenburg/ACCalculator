//
//  efficiencyModel.swift
//  ACCalculator
//
//  Created by Jake SWEDENBURG on 9/19/16.
//  Copyright © 2016 Jake Swedenbug. All rights reserved.
//

import Foundation

private let constant: Float = 3.412

private let coolingLoad: Float = 12.0

struct KwPerTon {
    
    let kwPerTon: Float
    var eer: Float {
        return coolingLoad / kwPerTon
    }
    
    var cop: Float {
        return coolingLoad / kwPerTon / constant
    }
}

struct Eer {
    let eer: Float
    
    var kwPerTon: Float {
       return coolingLoad / eer
    }
    
    var cop: Float {
        return eer / constant
    }
}

struct Cop {
    let cop: Float
    
    var kwPerTon: Float {
        return 12 / (cop * constant)
    }
    
    var eer: Float {
        return cop * constant
    }
}
