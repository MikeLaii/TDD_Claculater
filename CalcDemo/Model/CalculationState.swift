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
    var initiativeValut : String = .defaultString
    var isBehindSymbol : Bool = false
}
 
class CalculationContext {
    var data : CalcData = CalcData()
    var lastState : CalculationState = CalculationClean()
    var display : String {
        return data.display
    }
    
    func push(_ state:CalculationState){
        state.push(type: lastState.type, data: &data)
        if state.type.calculationType == .command || state.type == .clean{
            lastState = state
        }
    }
}

protocol CalculationState {
    var type : ButtonType { get }
    var name : String { get }
    var calculationType : CalculationType { get }
    func push(type : ButtonType , data : inout CalcData )
}

extension CalculationState {
    var name : String {
        return type.rawValue
    }
    var calculationType : CalculationType {
        return type.calculationType
    }
}

//MARK: - Number State
protocol CalculationNumberState : CalculationState {}

extension CalculationNumberState {
    func push(type : ButtonType , data : inout CalcData){
        if data.isBehindSymbol {
            data.passiveValue = data.display
            data.display = .defaultString
            data.isBehindSymbol = false
        }
        if data.display.count < 9 {
            data.display = (data.display == .defaultString) ? name : data.display + name
            
            if data.passiveValue.toDouble != 0{
                data.initiativeValut = data.display
            }else{
                data.passiveValue = data.display
            }
        }
    }
}

//MARK: - Command State
protocol CalculationCommandState : CalculationState{}

extension CalculationCommandState {
    func push(type: ButtonType, data: inout CalcData) {
        if type.calculationType == .function {
            if data.passiveValue == .defaultString{
                data.passiveValue = data.display
            }
        }

        if type.calculationType == .command{
            switch type {
            case .addition: data.display = (data.passiveValue.toDouble + data.initiativeValut.toDouble).toString
            case .subtraction : data.display = (data.passiveValue.toDouble - data.initiativeValut.toDouble).toString
            case .multiplication : data.display = (data.passiveValue.toDouble * data.initiativeValut.toDouble).toString
            case .division : data.display = (data.passiveValue.toDouble / data.initiativeValut.toDouble).toString
            default: print("other")
            }
            data.passiveValue = data.display
        }
        data.isBehindSymbol = true

    }
}

//MARK: - Action
class CalculationZero: CalculationNumberState {
    var type : ButtonType { return .zero }
}
class CalculationOne: CalculationNumberState {
    var type : ButtonType { return .one }
}
class CalculationTwo: CalculationNumberState {
    var type : ButtonType { return .two }
}
class CalculationThree: CalculationNumberState {
    var type : ButtonType { return .three }
}
class CalculationFour: CalculationNumberState {
    var type : ButtonType { return .four }
}
class CalculationFive: CalculationNumberState {
    var type : ButtonType { return .five }
}
class CalculationSix: CalculationNumberState {
    var type : ButtonType { return .six }
}
class CalculationSeven: CalculationNumberState {
    var type : ButtonType { return .seven }
}
class CalculationEight: CalculationNumberState {
    var type : ButtonType { return .eight }
}
class CalculationNine: CalculationNumberState {
    var type : ButtonType { return .nine }
}
class CalculationAddition: CalculationCommandState {
    var type : ButtonType { return .addition }
}
class CalculationSubtraction: CalculationCommandState {
    var type : ButtonType { return .subtraction }
}
class CalculationMultiplication: CalculationCommandState {
    var type : ButtonType { return .multiplication }
}
class CalculationDivision: CalculationCommandState {
    var type : ButtonType { return .division }
}
class CalculationSign: CalculationState {
    var type : ButtonType { return .sign }
    func push(type: ButtonType, data: inout CalcData) {
        if data.display != .defaultString{
            data.display = (-data.display.toDouble).toString
            if data.passiveValue == .defaultString{
                data.passiveValue = data.display
            }else{
                data.initiativeValut = data.display
            }
        }
    }
}
class CalculationPercentage: CalculationState {
    var type : ButtonType { return .percentage }
    func push(type: ButtonType, data: inout CalcData) {
        data.display = (data.display.toDouble * 0.01).toString
        if data.passiveValue == .defaultString{
            data.passiveValue = data.display
        }else{
            data.initiativeValut = data.display
        }
    }
}
class CalculationDot: CalculationState {
    var type : ButtonType { return .dot }
    func push(type: ButtonType, data: inout CalcData) {
        if !data.display.contains("."){
            data.display.append(".")
        }
        if data.passiveValue == .defaultString{
            data.passiveValue = data.display
        }else{
            data.initiativeValut = data.display
        }
    }
}
class CalculationEqual: CalculationState {
    var type : ButtonType { return .equal }
    func push(type: ButtonType, data: inout CalcData) {
        if type.state.calculationType == .command {
            type.state.push(type: type, data: &data)
        }
    }
}
class CalculationClean: CalculationState {
    var type : ButtonType { return .clean }
    func push(type: ButtonType, data: inout CalcData) {
        data = CalcData()
    }
}
