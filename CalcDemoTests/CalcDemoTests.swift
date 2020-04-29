//
//  CalcDemoTests.swift
//  CalcDemoTests
//
//  Created by Mike Lai on 2019/4/15.
//  Copyright © 2019 Mike.Lai. All rights reserved.
//

import XCTest
import Nimble
@testable import CalcDemo

class CalcDemoTests: XCTestCase {
    let vm = ViewModel()
    var result = ""
    
    override func setUp() {
        self.vm.output = {[weak self](value)in
            self?.result = value
        }
        self.testNumber()
        self.testOperators()
        self.testFunction()
    }
}
extension CalcDemoTests {
    func testNumber(){
        self.vm.run(.clear)
        self.vm.run(.zero)
        self.vm.run(.one)
        self.vm.run(.two)
        self.vm.run(.three)
        self.vm.run(.four)
        self.vm.run(.five)
        self.vm.run(.six)
        self.vm.run(.seven)
        self.vm.run(.eight)
        self.vm.run(.nine)
        expect(self.result).to(equal("123456789"))
    }
    func testOperators(){
        self.vm.run(.clear) //加
        self.vm.run(.one)
        self.vm.run(.add)
        self.vm.run(.nine)
        self.vm.run(.equal)
        expect(self.result).to(equal("10"))
        self.vm.run(.clear) //減
        self.vm.run(.nine)
        self.vm.run(.sub)
        self.vm.run(.one)
        self.vm.run(.equal)
        expect(self.result).to(equal("8"))
        self.vm.run(.clear) //乘
        self.vm.run(.nine)
        self.vm.run(.mul)
        self.vm.run(.two)
        self.vm.run(.equal)
        expect(self.result).to(equal("18"))
        self.vm.run(.clear) //除
        self.vm.run(.nine)
        self.vm.run(.div)
        self.vm.run(.three)
        self.vm.run(.equal)
        expect(self.result).to(equal("3"))
    }
    func testFunction(){
        self.testDot()
        self.testSign()
        self.testPerc()
        self.testEqual()
        self.vm.run(.clear) //AC
        expect(self.result).to(equal("0"))
    }
    func testDot(){
        self.vm.run(.clear)
        self.vm.run(.one)
        expect(self.result).to(equal("1"))
        self.vm.run(.dot)
        expect(self.result).to(equal("1."))
        self.vm.run(.dot)
        expect(self.result).to(equal("1."))
    }
    func testSign(){
        self.vm.run(.clear)
        self.vm.run(.one)
        expect(self.result).to(equal("1"))
        self.vm.run(.sign)
        expect(self.result).to(equal("-1"))
        self.vm.run(.sign)
        expect(self.result).to(equal("1"))
    }
    func testPerc(){
        self.vm.run(.clear)
        self.vm.run(.one)
        expect(self.result).to(equal("1"))
        self.vm.run(.perc)
        expect(self.result).to(equal("0.01"))
        self.vm.run(.perc)
        expect(self.result).to(equal("0.0001"))
    }
    func testEqual(){
        self.vm.run(.clear)
        self.vm.run(.one)
        expect(self.result).to(equal("1"))
        self.vm.run(.mul)
        self.vm.run(.two)
        self.vm.run(.dot)
        self.vm.run(.five)
        expect(self.result).to(equal("2.5"))
        self.vm.run(.sign)
        expect(self.result).to(equal("-2.5"))
        self.vm.run(.equal)
        expect(self.result).to(equal("-2.5"))
        self.vm.run(.equal)
        expect(self.result).to(equal("6.25"))
        self.vm.run(.equal)
        expect(self.result).to(equal("-15.625"))
    }
   
    
//    func input(_ type:ButtonType , data:inout CalcData){
//        switch type {
//        case .add,.sub,.mul,.div:
//            data.operators = Operators(rawValue: type.rawValue) ?? .none
//            if data.value1 == .defaultString {
//                data.value1 = data.display
//            }
//            data.isBehindSymbol = true
//        case .sign: data.display = (-(data.display.toDouble())).toString()
//        case .dot: data.display = data.display.contains(".") ? data.display : data.display + "."
//        case .perc: data.display = (data.display.toDouble() / 100).toString()
//        case .clear: data = CalcData()
//        case .equal: guard data.operators != .none else {break}
//        equalTo(data.operators, data: &data)
//        default:
//            if data.isBehindSymbol{
//                data.display = .defaultString
//                data.isBehindSymbol = false
//            }
//            if data.display.count < 9 {
//                data.display = data.display == .defaultString ? type.rawValue : data.display + type.rawValue
//            }
//        }
//    }
//    func equalTo(_ operators:Operators,data:inout CalcData){
//        if data.value1 != .defaultString && data.value2 == .defaultString{
//            data.value2 = data.display
//        }
//        switch operators {
//        case .add: data.display = (data.value1.toDouble() + data.value2.toDouble()).toString()
//        case .sub: data.display = (data.value1.toDouble() - data.value2.toDouble()).toString()
//        case .mul: data.display = (data.value1.toDouble() * data.value2.toDouble()).toString()
//        case .div: data.display = (data.value1.toDouble() / data.value2.toDouble()).toString()
//        default:
//            break
//        }
//        data.value1 = data.display
//        data.isBehindSymbol = true
//    }
//    func testNumber(){
//        var data = ClacData()
//        self.input(.zero, data: &data)
//        self.input(.one, data: &data)
//        self.input(.two, data: &data)
//        self.input(.three, data: &data)
//        self.input(.four, data: &data)
//        self.input(.five, data: &data)
//        self.input(.six, data: &data)
//        self.input(.seven, data: &data)
//        self.input(.eight, data: &data)
//        self.input(.nine, data: &data)
//        expect(data.display).to(equal("123456789"))
//    }
//    func testOperators(){
//        var data = ClacData()
//        self.input(.one, data: &data)
//        self.input(.add, data: &data)
//        self.input(.nine, data: &data)
//        self.input(.equal, data: &data)
//        expect(data.display).to(equal("10"))
//        self.input(.sub, data: &data)
//        self.input(.one, data: &data)
//        self.input(.equal, data: &data)
//        expect(data.display).to(equal("9"))
//        self.input(.mul, data: &data)
//        self.input(.two, data: &data)
//        self.input(.equal, data: &data)
//        expect(data.display).to(equal("18"))
//        self.input(.div, data: &data)
//        self.input(.three, data: &data)
//        self.input(.equal, data: &data)
//        expect(data.display).to(equal("6"))
//    }
//    func testFunction(){
//        var data = ClacData()
//        self.input(.one, data: &data)
//        self.input(.sign, data: &data)
//        expect(data.display).to(equal("-1"))
//        self.input(.dot, data: &data)
//        expect(data.display).to(equal("-1."))
//        self.input(.dot, data: &data)
//        expect(data.display).to(equal("-1."))
//        self.input(.three, data: &data)
//        expect(data.display).to(equal("-1.3"))
//        self.input(.perc, data: &data)
//        expect(data.display).to(equal("-0.013"))
//        self.input(.sign, data: &data)
//        expect(data.display).to(equal("0.013"))
//        self.input(.clear, data: &data)
//        expect(data.display).to(equal("0"))
//    }
    
}
