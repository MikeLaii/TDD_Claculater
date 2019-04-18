//
//  OperationType.swift
//  CalcDemo
//
//  Created by Mike Lai on 2019/4/16.
//  Copyright © 2019 Mike.Lai. All rights reserved.
//

import UIKit

enum CalculationType {
    case command
    case function
    case number
    case result
}

enum ButtonType: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case dot 
    case addition
    case subtraction
    case division
    case multiplication
    case equal
    case sign
    case clean
    case percentage
}

extension ButtonType {
    
    var calculationType : CalculationType {
        switch self {
        case .addition ,
             .division ,
             .multiplication ,
             .subtraction :
            return .command
        case .clean ,
             .percentage ,
             .sign :
            return .function
        case .equal :
            return .result
        default:
            return .number
        }
    }
      
    var state:CalculationState {
        switch self {
        case .zero : return CalculationZero()
        case .one : return CalculationOne()
        case .two : return CalculationTwo()
        case .three : return CalculationThree()
        case .four : return CalculationFour()
        case .five : return CalculationFive()
        case .six : return CalculationSix()
        case .seven : return CalculationSeven()
        case .eight : return CalculationEight()
        case .nine : return CalculationNine()
        case .addition : return CalculationAddition()
        case .subtraction : return CalculationSubtraction()
        case .multiplication : return CalculationMultiplication()
        case .division : return CalculationDivision()
        case .percentage : return CalculationPercentage()
        case .dot : return CalculationDot()
        case .sign : return CalculationSign()
        case .equal : return CalculationEqual()
        case .clean : return CalculationClean()
        }
    }
}
