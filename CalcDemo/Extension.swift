//
//  Extension.swift
//  CalcDemo
//
//  Created by Mike Lai on 2019/4/15.
//  Copyright © 2019 Mike.Lai. All rights reserved.
//

import Foundation

extension Double {
    var toString:String{
        return String.init(format: "%g", self)
    }
}
 
extension String{
    static let defaultString : String = "0"
    var toDouble:Double{
        return Double.init(self) ?? 0.0
    }
}

