//
//  Extension.swift
//  CalcDemo
//
//  Created by Mike Lai on 2019/4/15.
//  Copyright © 2019 Mike.Lai. All rights reserved.
//

extension String{
    static let defaultString = "0"
    func toDouble()->Double{
        return Double.init(self) ?? 0.0
    }
}
extension Double{
    func toString()->String{
        return String.init(format: "%g", self)
    }
}
