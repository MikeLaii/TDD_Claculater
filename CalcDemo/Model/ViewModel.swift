//
//  ViewModel.swift
//  CalcDemo
//
//  Created by Mike Lai on 2019/4/16.
//  Copyright © 2019 Mike.Lai. All rights reserved.
//

import UIKit

class ViewModel {
    
    var outPut : ((String)->Void)!
    var connector : CalculationConnector = CalculationConnector()
    
    func run(_ type : ButtonType ){
        connector.push(type.state)
        outPut(connector.display)
    }
}
  
