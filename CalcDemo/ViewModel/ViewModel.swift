//
//  ViewModel.swift
//  CalcDemo
//
//  Created by Mike Lai on 2019/4/16.
//  Copyright © 2019 Mike.Lai. All rights reserved.
//

class ViewModel {
    var data : CalcData!
    var input : ButtonType = .clear
    var output : ((String)->())?
    
    init() {
        self.data = CalcData()
    }
    func run(_ type:ButtonType){
        self.input(type, data: &data)
        self.output?(data.display)
    }
}
extension ViewModel{
    func input(_ type:ButtonType , data:inout CalcData){
        switch type {
        case .add,.sub,.mul,.div:
            data.operators = Operators(rawValue: type.rawValue) ?? .none
            if data.value1 == .defaultString {
                data.value1 = data.display
            }
            data.isBehindSymbol = true
        case .sign: data.display = (-(data.display.toDouble())).toString()
        case .dot: data.display = data.display.contains(".") ? data.display : data.display + "."
        case .perc: data.display = (data.display.toDouble() / 100).toString()
        case .clear: data = CalcData()
        case .equal: guard data.operators != .none else {break}
                    self.equalTo(data.operators, data: &data)
        default:
            if data.isBehindSymbol{
                data.display = .defaultString
                data.isBehindSymbol = false
            }
            if data.display.count < 9 {
                data.display = data.display == .defaultString ? type.rawValue : data.display + type.rawValue
            }
        }
    }
    func equalTo(_ operators:Operators,data:inout CalcData){
        if data.value1 != .defaultString && data.value2 == .defaultString{
            data.value2 = data.display
        }
        switch operators {
        case .add: data.display = (data.value1.toDouble() + data.value2.toDouble()).toString()
        case .sub: data.display = (data.value1.toDouble() - data.value2.toDouble()).toString()
        case .mul: data.display = (data.value1.toDouble() * data.value2.toDouble()).toString()
        case .div: data.display = (data.value1.toDouble() / data.value2.toDouble()).toString()
        default:
            break
        }
        data.value1 = data.display
        data.isBehindSymbol = true
    }
}

