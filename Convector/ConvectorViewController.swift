//
//  ConvectorViewController.swift
//  Convector
//
//  Created by Дмитрий Коробов on 06.08.17.
//  Copyright © 2017 Дмитрий Коробов. All rights reserved.
//

import UIKit

class ConvectorViewController: UIViewController {
    
    //MARK: @IBOutlets
    
    @IBOutlet weak var firstMeasurePickerView: UIPickerView!
    @IBOutlet weak var secondMeasurePickerView: UIPickerView!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    //MARK: @IBActions
    
    @IBAction func changeConvectionDirection(_ sender: UIButton) {
        brain.changeConvertionDirection()
        resultLabel.text = String(brain.calculateResult(Double(valueLabelText)!))
        updateUI()
    }
    
    @IBAction func changeMeasurementType(_ sender: UIButton) {
        switch sender.currentTitle! {
        case ButtonNames.length:
            brain.measurementType = Length()
        case ButtonNames.square:
            brain.measurementType = Square()
        case ButtonNames.liquid:
            brain.measurementType = Liquid()
        case ButtonNames.weight:
            brain.measurementType = Weight()
        case ButtonNames.temperature:
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
    var userInTheMiddleOfTyping: Bool = false
    
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
