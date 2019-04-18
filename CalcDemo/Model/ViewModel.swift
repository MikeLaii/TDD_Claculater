//
//  ViewModel.swift
//  CalcDemo
//
//  Created by Mike Lai on 2019/4/16.
//  Copyright © 2019 Mike.Lai. All rights reserved.
//

import UIKit

class ViewModel {
    
    struct ViewModelOutput {
        var handler : ((String)->Void)?
    }
    
    var outPut : ViewModelOutput
    var context : CalculationContext = CalculationContext()
    
    init() {
        self.outPut = ViewModelOutput()
    }
    
    func run(_ type : ButtonType ){
        context.push(type.state)
        outPut.handler?(context.display)
    }
     
}
 
