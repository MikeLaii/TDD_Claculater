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
    var viewModel : ViewModel!
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.initialText()
    }
    //MARK: - Buttom Action
    @IBAction func cleanBtnAction(_ sender: Any) {
        self.viewModel.run(.clear)
    }
    @IBAction func signBtnAction(_ sender: Any) {
        self.viewModel.run(.sign)
    }
    @IBAction func percentageBtnAction(_ sender: Any) {
        self.viewModel.run(.perc)
    }
    @IBAction func divisionBtnAction(_ sender: Any) {
        self.viewModel.run(.div)
    }
    @IBAction func multBtnAction(_ sender: Any) {
        self.viewModel.run(.mul)
    }
    @IBAction func subtractionBtnAction(_ sender: Any) {
        self.viewModel.run(.sub)
    }
    @IBAction func additionBtnAction(_ sender: Any) {
        self.viewModel.run(.add)
    }
    @IBAction func resultBtnAction(_ sender: Any) {
        self.viewModel.run(.equal)
    }
    @IBAction func dotBtnAction(_ sender: Any) {
        self.viewModel.run(.dot)
    }
    @IBAction func zeroBtnAction(_ sender: Any) {
        self.viewModel.run(.zero)
    }
    @IBAction func oneBtnAction(_ sender: Any) {
        self.viewModel.run(.one)
    }
    @IBAction func twoBtnAction(_ sender: Any) {
        self.viewModel.run(.two)
    }
    @IBAction func threeBtnAction(_ sender: Any) {
        self.viewModel.run(.three)
    }
    @IBAction func fourBtnAction(_ sender: Any) {
        self.viewModel.run(.four)
    }
    @IBAction func fiveBtnAction(_ sender: Any) {
        self.viewModel.run(.five)
    }
    @IBAction func sixBtnAction(_ sender: Any) {
        self.viewModel.run(.six)
    }
    @IBAction func sevenBtnAction(_ sender: Any) {
        self.viewModel.run(.seven)
    }
    @IBAction func eightBtnAction(_ sender: Any) {
        self.viewModel.run(.eight)
    }
    @IBAction func nineBtnAction(_ sender: Any) {
        self.viewModel.run(.nine)
    }
}
extension ViewController {
    //MARK: - Setup
    func setupUI(){
        self.mainView.resultLabel.text = .defaultString
        self.mainView.resultLabel.adjustsFontSizeToFitWidth = true
        self.mainView.resultLabel.minimumScaleFactor = 0.5
        self.setupButtonUI(stackView: mainView.horizontalOne)
        self.setupButtonUI(stackView: mainView.horizontalTwo)
        self.setupButtonUI(stackView: mainView.horizontalThree)
        self.setupButtonUI(stackView: mainView.horizontalFour)
        self.setupButtonUI(stackView: mainView.horizontalFive)
    }
    func setupButtonUI(stackView:UIStackView){
        for case let button in stackView.subviews{
            let size = min(button.frame.size.height, button.frame.size.width)
            button.layer.cornerRadius = size / 2
            button.clipsToBounds = true
        }
        self.view.layoutIfNeeded()
    }
    func initialText(){
        self.viewModel = ViewModel.init()
        self.viewModel.output = { [weak self] (value) in
            self?.mainView.resultLabel.text = value
        }
        self.viewModel.run(.clear)
    }
}
