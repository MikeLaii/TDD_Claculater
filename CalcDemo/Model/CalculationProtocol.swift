//
//  OperationState.swift
//  CalcDemo
//
//  Created by Mike Lai on 2019/4/16.
//  Copyright © 2019 Mike.Lai. All rights reserved.
//

import UIKit

struct CalcData {
    var display : String = .defaultString
    var passiveValue : String = .defaultString
    var initiativeValue : String = .defaultString
    var operators : Operators = .none
    var isBehindSymbol : Bool = false
}

class CalculationConnector {
    var data : CalcData = CalcData()
    var display : String {
        return data.display
    }
    func push(_ state:CalculationProtocol){
        state.pushTo(type: state.type, data: &data)
    }
}

protocol CalculationProtocol {
    var type : ButtonType { get }
    var name : String {get}
    func pushTo(type : ButtonType , data : inout CalcData )
}
extension CalculationProtocol {
    var name : String { return type.rawValue }
}

//MARK: - Number State
protocol CalculationNumberProtocol : CalculationProtocol {}
extension CalculationNumberProtocol {
    func pushTo(type : ButtonType , data : inout CalcData){
        if data.display.count < 9 {
            if data.isBehindSymbol {
                data.display = .defaultString
                data.isBehindSymbol = false
            }
            data.display = (data.display == .defaultString) ? name : data.display + name
        }
    }
}

//MARK: - Operators State
protocol CalculationOperatorsProtocol : CalculationProtocol{}
extension CalculationOperatorsProtocol {
    func pushTo(type: ButtonType, data: inout CalcData) {
        
        if data.passiveValue != .defaultString && data.initiativeValue != .defaultString{ //算過一次=後的加號
            data.passiveValue = data.display
            data.initiativeValue = .defaultString
        }else if data.passiveValue == .defaultString {
            data.passiveValue = data.display
        }else if data.initiativeValue == .defaultString{
            data.initiativeValue = data.display
        }
        data.operators = Operators(rawValue: name) ?? data.operators //儲存新的運算子狀態or原狀態
        data.isBehindSymbol = true
    }
}

//MARK: -Calc State
class CalculationZero: CalculationNumberProtocol {
    var type : ButtonType { return .zero }
}
class CalculationOne: CalculationNumberProtocol {
    var type : ButtonType { return .one }
}
class CalculationTwo: CalculationNumberProtocol {
    var type : ButtonType { return .two }
}
class CalculationThree: CalculationNumberProtocol {
    var type : ButtonType { return .three }
}
class CalculationFour: CalculationNumberProtocol {
    var type : ButtonType { return .four }
}
class CalculationFive: CalculationNumberProtocol {
    var type : ButtonType { return .five }
}
class CalculationSix: CalculationNumberProtocol {
    var type : ButtonType { return .six }
}
class CalculationSeven: CalculationNumberProtocol {
    var type : ButtonType { return .seven }
}
class CalculationEight: CalculationNumberProtocol {
    var type : ButtonType { return .eight }
}
class CalculationNine: CalculationNumberProtocol {
    var type : ButtonType { return .nine }
}
class CalculationAddition: CalculationOperatorsProtocol {
    var type : ButtonType { return .addition }
}
class CalculationSubtraction: CalculationOperatorsProtocol {
    var type : ButtonType { return .subtraction }
}
class CalculationMultiplication: CalculationOperatorsProtocol {
    var type : ButtonType { return .multiplication }
}
class CalculationDivision: CalculationOperatorsProtocol {
    var type : ButtonType { return .division }
}
class CalculationSign: CalculationProtocol {
    var type : ButtonType { return .sign }
    func pushTo(type: ButtonType, data: inout CalcData) {
        if data.display != .defaultString{
            data.display = (-data.display.toDouble).toString
        }
    }
}
class CalculationPercentage: CalculationProtocol {
    var type : ButtonType { return .percentage }
    func pushTo(type: ButtonType, data: inout CalcData) {
        data.display = (data.display.toDouble * 0.01).toString
    }
}
class CalculationDot: CalculationProtocol {
    var type : ButtonType { return .dot }
    func pushTo(type: ButtonType, data: inout CalcData) {
        if !data.display.contains("."){
            data.display.append(".")
        }
    }
}
class CalculationEqual: CalculationProtocol {
    var type : ButtonType { return .equal }
    func pushTo(type: ButtonType, data: inout CalcData) {
        if data.passiveValue != .defaultString && data.initiativeValue == .defaultString{
            data.initiativeValue = data.display
        }
        switch data.operators {
        case .addition: data.display = (data.passiveValue.toDouble + data.initiativeValue.toDouble).toString
        case .subtraction : data.display = (data.passiveValue.toDouble - data.initiativeValue.toDouble).toString
        case .multiplication : data.display = (data.passiveValue.toDouble * data.initiativeValue.toDouble).toString
        case .division : data.display = (data.passiveValue.toDouble / data.initiativeValue.toDouble).toString
        case .none: print("no operators")
        }
        data.passiveValue = data.display
        data.isBehindSymbol = true
    }
}
class CalculationClean: CalculationProtocol {
    var type : ButtonType { return .clean }
    func pushTo(type: ButtonType, data: inout CalcData) {
        data = CalcData()
    }
}
