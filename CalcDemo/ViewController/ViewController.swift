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
    var viewModel : ViewModel = ViewModel()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        setupUI()
        initialText()
    }
  
    //MARK: - Buttom Action
    @IBAction func cleanBtnAction(_ sender: Any) {
        viewModel.run(.clean)
    }
    @IBAction func signBtnAction(_ sender: Any) {
        viewModel.run(.sign)
    }
    @IBAction func percentageBtnAction(_ sender: Any) {
        viewModel.run(.percentage)
    }
    @IBAction func divisionBtnAction(_ sender: Any) {
        viewModel.run(.division)
    }
    @IBAction func multBtnAction(_ sender: Any) {
        viewModel.run(.multiplication)
    }
    @IBAction func subtractionBtnAction(_ sender: Any) {
        viewModel.run(.subtraction)
    }
    @IBAction func additionBtnAction(_ sender: Any) {
        viewModel.run(.addition)
    }
    @IBAction func resultBtnAction(_ sender: Any) {
        viewModel.run(.equal)
    }
    @IBAction func dotBtnAction(_ sender: Any) {
        viewModel.run(.dot)
    }
    @IBAction func zeroBtnAction(_ sender: Any) {
        viewModel.run(.zero)
    }
    @IBAction func oneBtnAction(_ sender: Any) {
        viewModel.run(.one)
    }
    @IBAction func twoBtnAction(_ sender: Any) {
        viewModel.run(.two)
    }
    @IBAction func threeBtnAction(_ sender: Any) {
        viewModel.run(.three)
    }
    @IBAction func fourBtnAction(_ sender: Any) {
        viewModel.run(.four)
    }
    @IBAction func fiveBtnAction(_ sender: Any) {
        viewModel.run(.five)
    }
    @IBAction func sixBtnAction(_ sender: Any) {
        viewModel.run(.six)
    }
    @IBAction func sevenBtnAction(_ sender: Any) {
        viewModel.run(.seven)
    }
    @IBAction func eightBtnAction(_ sender: Any) {
        viewModel.run(.eight)
    }
    @IBAction func nineBtnAction(_ sender: Any) {
        viewModel.run(.nine)
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
        for case let button in stackView.subviews{
            let size = min(button.frame.size.height, button.frame.size.width)
            button.layer.cornerRadius = size / 2
            button.clipsToBounds = true
        }
    }
    func initialText(){
        viewModel.outPut = { [weak self] value in
            self?.mainView.resultLabel.text = value
        }
        viewModel.run(.clean)
    }
}
