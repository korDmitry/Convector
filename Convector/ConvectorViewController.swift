//
//  ConvectorViewController.swift
//  Convector
//
//  Created by Дмитрий Коробов on 06.08.17.
//  Copyright © 2017 Дмитрий Коробов. All rights reserved.
//

import UIKit

class ConvectorViewController: UIViewController {
    
    override func viewDidLoad() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.changeConvectionDirection))
        tapRecognizer.numberOfTapsRequired = 1
        valueStackView.addGestureRecognizer(tapRecognizer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        lengthButton.layer.borderWidth = 1.5
        valueLabel.layer.addBorder(edge: .bottom, color: UIColor.white, thickness: 0.5)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: @IBOutlets
    
    @IBOutlet weak var firstMeasurePickerView: UIPickerView!
    @IBOutlet weak var secondMeasurePickerView: UIPickerView!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var displayStackView: UIStackView!
    @IBOutlet weak var valueStackView: UIStackView!
    
    @IBOutlet weak var cleanButton: UIButton!
    @IBOutlet weak var lengthButton: UIButton!
    @IBOutlet weak var squareButton: UIButton!
    @IBOutlet weak var volumeButton: UIButton!
    @IBOutlet weak var liquidButton: UIButton!
    @IBOutlet weak var speedButton: UIButton!
    @IBOutlet weak var weightButton: UIButton!
    @IBOutlet weak var temperatureButton: UIButton!
    
    
    //MARK: @IBActions
    
    @IBAction func changeMeasurementType(_ sender: UIButton) {
        lengthButton.layer.borderWidth = 0.25
        squareButton.layer.borderWidth = 0.25
        volumeButton.layer.borderWidth = 0.25
        liquidButton.layer.borderWidth = 0.25
        speedButton.layer.borderWidth = 0.25
        weightButton.layer.borderWidth = 0.25
        temperatureButton.layer.borderWidth = 0.25
        sender.layer.borderWidth = 1.5
        
        switch sender {
        case lengthButton:
            brain.measurementType = Length()
        case squareButton:
            brain.measurementType = Square()
        case volumeButton:
            brain.measurementType = Volume()
        case liquidButton:
            brain.measurementType = Liquid()
        case speedButton:
            brain.measurementType = Speed()
        case weightButton:
            brain.measurementType = Weight()
        case temperatureButton:
            brain.measurementType = Temperature()
        default:
            break
        }
        resultLabelText = String(brain.calculateResult(Double(valueLabelText)!))
        updateUI()
        
        firstMeasurePickerView.selectRow(0, inComponent: 0, animated: true)
        secondMeasurePickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    @IBAction func changeSign(_ sender: UIButton) {
        if valueLabelText != "0" {
            let newValue = Double(valueLabelText)! * (-1)
            valueLabelText = String(newValue)
        }
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userInTheMiddleOfTyping {
            valueLabelText = valueLabelText + digit
        }
        else {
            valueLabelText = digit
            userInTheMiddleOfTyping = true
        }
    }

    @IBAction func touchDot(_ sender: UIButton) {
        if !userDialNumberWithDot {
            let dot = sender.currentTitle!
            valueLabelText = valueLabelText + dot
            userDialNumberWithDot = true
            userInTheMiddleOfTyping = true
        }
    }
    
    @IBAction func cleanDigits(_ sender: UIButton) {
        valueLabelText = "0"
        userInTheMiddleOfTyping = false
        userDialNumberWithDot = false
    }
    
    //MARK: Variables
    
    var brain: Brain = Brain()
    var userDialNumberWithDot: Bool = false
    var userInTheMiddleOfTyping: Bool = false {
        didSet {
            if self.userInTheMiddleOfTyping {
                cleanButton.setTitle("C", for: UIControlState.normal)
            }
            else {
                cleanButton.setTitle("AC", for: UIControlState.normal)
            }
        }
    }
    
    var valueLabelText: String {
        get {
            return valueLabel.text!
        }
        set {
            valueLabel.text = newValue
            if (newValue != "0.") {
                resultLabelText = String(brain.calculateResult(Double(newValue)!))
            }
        }
    }
    
    var resultLabelText: String {
        get {
            return resultLabel.text!
        }
        set {
            if newValue == "0.0" {
                resultLabel.text = "0"
            }
            else {
                resultLabel.text = newValue
            }
        }
    }
    
    //MARK: functions
    
    func changeConvectionDirection() {
        let firstPVSelectedRow = firstMeasurePickerView.selectedRow(inComponent: 0)
        let secondPVSeletedRow = secondMeasurePickerView.selectedRow(inComponent: 0)
        
        brain.changeConvertionDirection()
        resultLabelText = String(brain.calculateResult(Double(valueLabelText)!))
        updateUI()
        
        firstMeasurePickerView.selectRow(secondPVSeletedRow, inComponent: 0, animated: true)
        secondMeasurePickerView.selectRow(firstPVSelectedRow, inComponent: 0, animated: true)
    }
    
    func updateUI() {
        firstMeasurePickerView.reloadAllComponents()
        secondMeasurePickerView.reloadAllComponents()
    }
}



//MARK: PickerView DataSource & Delegate

extension ConvectorViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if brain.convertionDirection == .ImperialToMetric {
            if pickerView == firstMeasurePickerView {
                return brain.measurementType.unitsImperial.count
            }
            else {
                return brain.measurementType.unitsMetric.count
            }
        }
        else {
            if pickerView == firstMeasurePickerView {
                return brain.measurementType.unitsMetric.count
            }
            else {
                return brain.measurementType.unitsImperial.count
                
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var text = ""
        
        if brain.convertionDirection == .ImperialToMetric {
            if pickerView == firstMeasurePickerView {
                text = brain.measurementType.unitsImperial[row].name
            }
            else {
                text = brain.measurementType.unitsMetric[row].name
            }
        }
        else {
            if pickerView == firstMeasurePickerView {
                text = brain.measurementType.unitsMetric[row].name
            }
            else {
                text = brain.measurementType.unitsImperial[row].name
            }
        }
        
        let title = NSAttributedString(string: text, attributes: [
            NSFontAttributeName : UIFont.systemFont(ofSize: 30.0, weight: UIFontWeightThin),
            NSForegroundColorAttributeName : UIColor.white
            ])
        
        let label = (view as? UILabel) ?? UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.attributedText = title
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if brain.convertionDirection == .ImperialToMetric {
            if pickerView == firstMeasurePickerView {
                brain.setUnitImperial(withIndex: row)
            }
            else {
                brain.setUnitMetric(withIndex: row)
            }
        }
        else {
            if pickerView == firstMeasurePickerView {
                brain.setUnitMetric(withIndex: row)
            }
            else {
                brain.setUnitImperial(withIndex: row)
            }
        }
        resultLabelText = String(brain.calculateResult(Double(valueLabelText)!))
        updateUI()
    }
}


extension CALayer {
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        let border = CALayer()
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
            break
        default:
            break
        }
        border.backgroundColor = color.cgColor;
        self.addSublayer(border)
    }
}
