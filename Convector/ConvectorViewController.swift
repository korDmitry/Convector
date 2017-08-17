//
//  ConvectorViewController.swift
//  Convector
//
//  Created by Дмитрий Коробов on 06.08.17.
//  Copyright © 2017 Дмитрий Коробов. All rights reserved.
//

import UIKit

class ConvectorViewController: UIViewController {
    
    override func viewWillLayoutSubviews() {
        switch self.view.frame.width {
        case 375.0:
            firstMeasurePickerView.widthAnchor.constraint(equalToConstant: 94.0).isActive = true
            secondMeasurePickerView.widthAnchor.constraint(equalToConstant: 94.0).isActive = true
            displayStackView.heightAnchor.constraint(equalToConstant: 177).isActive = true
        case 414.0:
            firstMeasurePickerView.widthAnchor.constraint(equalToConstant: 103.5).isActive = true
            secondMeasurePickerView.widthAnchor.constraint(equalToConstant: 103.5).isActive = true
            displayStackView.heightAnchor.constraint(equalToConstant: 218.5).isActive = true
        default:
            break
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        valueLabel.layer.addBorder(edge: .bottom, color: UIColor.white, thickness: 0.5)
    }
    
    //MARK: @IBOutlets
    
    @IBOutlet weak var firstMeasurePickerView: UIPickerView!
    @IBOutlet weak var secondMeasurePickerView: UIPickerView!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var displayStackView: UIStackView!
    
    @IBOutlet weak var cleanButton: UIButton!
    @IBOutlet weak var lengthButton: UIButton!
    @IBOutlet weak var squareButton: UIButton!
    @IBOutlet weak var liquidButton: UIButton!
    @IBOutlet weak var weightButton: UIButton!
    @IBOutlet weak var temperatureButton: UIButton!
    
    
    //MARK: @IBActions
    
    @IBAction func changeConvectionDirection(_ sender: UIButton) {
        brain.changeConvertionDirection()
        resultLabel.text = String(brain.calculateResult(Double(valueLabelText)!))
        updateUI()
    }
    
    @IBAction func changeMeasurementType(_ sender: UIButton) {
        
        lengthButton.layer.borderWidth = 0
        squareButton.layer.borderWidth = 0
        liquidButton.layer.borderWidth = 0
        weightButton.layer.borderWidth = 0
        temperatureButton.layer.borderWidth = 0
        
        sender.layer.borderWidth = 1
        
        switch sender {
        case lengthButton:
            brain.measurementType = Length()
        case squareButton:
            brain.measurementType = Square()
        case liquidButton:
            brain.measurementType = Liquid()
        case weightButton:
            brain.measurementType = Weight()
        case temperatureButton:
            brain.measurementType = Temperature()
        default:
            break
        }
        resultLabel.text = String(brain.calculateResult(Double(valueLabelText)!))
        updateUI()
        
        firstMeasurePickerView.selectRow(0, inComponent: 0, animated: true)
        secondMeasurePickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userInTheMiddleOfTyping {
            let textCurrenlyInDisplay = valueLabel.text!
            valueLabelText = textCurrenlyInDisplay + digit
        }
        else {
            valueLabelText = digit
            userInTheMiddleOfTyping = true
        }
    }
    
    @IBAction func cleanDigits(_ sender: UIButton) {
        valueLabel.text = "0"
        resultLabel.text = "0"
        userInTheMiddleOfTyping = false
    }
    
    //MARK: Variables
    
    var brain: Brain = Brain()
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
            resultLabel.text = String(brain.calculateResult(Double(newValue)!))
        }
    }
    
    //MARK: Private functions
    
    func updateUI() {
        firstMeasurePickerView.reloadAllComponents()
        secondMeasurePickerView.reloadAllComponents()
    }
}


extension ConvectorViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    //MARK: PickerView DataSource & Delegate
    
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
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if brain.convertionDirection == .ImperialToMetric {
            if pickerView == firstMeasurePickerView {
                return NSAttributedString.init(string: brain.measurementType.unitsImperial[row].name,
                                               attributes: [NSForegroundColorAttributeName: UIColor.white])
            }
            else {
                return NSAttributedString.init(string: brain.measurementType.unitsMetric[row].name,
                                               attributes: [NSForegroundColorAttributeName: UIColor.white])
            }
        }
        else {
            if pickerView == firstMeasurePickerView {
                return NSAttributedString.init(string: brain.measurementType.unitsMetric[row].name,
                                               attributes: [NSForegroundColorAttributeName: UIColor.white])
            }
            else {
                return NSAttributedString.init(string: brain.measurementType.unitsImperial[row].name,
                                               attributes: [NSForegroundColorAttributeName: UIColor.white])
            }
        }
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
        resultLabel.text = String(brain.calculateResult(Double(valueLabelText)!))
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
