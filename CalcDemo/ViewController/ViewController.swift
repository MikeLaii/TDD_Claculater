//
//  ViewController.swift
//  CalcDemo
//
//  Created by Mike Lai on 2019/4/15.
//  Copyright © 2019 Mike.Lai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: MainView!
    var model : ViewModel = ViewModel()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        setupUI()
        initialText()
    }
 
    //MARK: - Buttom Action
    @IBAction func cleanBtnAction(_ sender: Any) {
        model.run(.clean)
    }
    @IBAction func signBtnAction(_ sender: Any) {
        model.run(.sign)
    }
    @IBAction func percentageBtnAction(_ sender: Any) {
        model.run(.percentage)
    }
    @IBAction func divisionBtnAction(_ sender: Any) {
        model.run(.division)
    }
    @IBAction func multBtnAction(_ sender: Any) {
        model.run(.multiplication)
    }
    @IBAction func subtractionBtnAction(_ sender: Any) {
        model.run(.subtraction)
    }
    @IBAction func additionBtnAction(_ sender: Any) {
        model.run(.addition)
    }
    @IBAction func resultBtnAction(_ sender: Any) {
        model.run(.equal)
    }
    @IBAction func dotBtnAction(_ sender: Any) {
        model.run(.dot)
    }
    @IBAction func zeroBtnAction(_ sender: Any) {
        model.run(.zero)
    }
    @IBAction func oneBtnAction(_ sender: Any) {
        model.run(.one)
    }
    @IBAction func twoBtnAction(_ sender: Any) {
        model.run(.two)
    }
    @IBAction func threeBtnAction(_ sender: Any) {
        model.run(.three)
    }
    @IBAction func fourBtnAction(_ sender: Any) {
        model.run(.four)
    }
    @IBAction func fiveBtnAction(_ sender: Any) {
        model.run(.five)
    }
    @IBAction func sixBtnAction(_ sender: Any) {
        model.run(.six)
    }
    @IBAction func sevenBtnAction(_ sender: Any) {
        model.run(.seven)
    }
    @IBAction func eightBtnAction(_ sender: Any) {
        model.run(.eight)
    }
    @IBAction func nineBtnAction(_ sender: Any) {
        model.run(.nine)
    }
}

extension ViewController {
    
    //MARK: - Setup
    func setupUI(){
        mainView.resultLabel.text = .defaultString
        mainView.resultLabel.adjustsFontSizeToFitWidth = true
        mainView.resultLabel.minimumScaleFactor = 0.5
        setupButtonUI(stackView: mainView.horizontalOne)
        setupButtonUI(stackView: mainView.horizontalTwo)
        setupButtonUI(stackView: mainView.horizontalThree)
        setupButtonUI(stackView: mainView.horizontalFour)
        setupButtonUI(stackView: mainView.horizontalFive)
    }
    func setupButtonUI(stackView:UIStackView){
        for i in 0..<stackView.subviews.count{
            guard let buttom = stackView.subviews[i] as? UIButton else {return}
            let size = min(buttom.frame.size.height, buttom.frame.size.width)
            buttom.layer.cornerRadius = size / 2
            buttom.clipsToBounds = true
        }
    }
    func initialText(){
        model.outPut.handler = { [weak self] value in
            self?.mainView.resultLabel.text = value
        }
        model.run(.clean)
    }
    
}
