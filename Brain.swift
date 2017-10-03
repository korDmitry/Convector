//
//  Brain.swift
//  Convector
//
//  Created by Дмитрий Коробов on 06.08.17.
//  Copyright © 2017 Дмитрий Коробов. All rights reserved.
//

import Foundation

struct Brain {
    
    var convertionDirection: Direction = .ImperialToMetric
    var measurementType: TypeProtocol = Length() {
        didSet {
            switch self.measurementType {
            case is Length:
                self.unitImperial = Inch()
                self.unitMetric = Millimeter()
            case is Square:
                self.unitImperial = SquareInch()
                self.unitMetric = SquareMeter()
            case is Volume:
                self.unitImperial = CubicInch()
                self.unitMetric = CubicMeter()
            case is Liquid:
                self.unitImperial = FluidOunce()
                self.unitMetric = Milliliter()
            case is Speed:
                self.unitImperial = FootPerSecond()
                self.unitMetric = MeterPerSecond()
            case is Weight:
                self.unitImperial = Ounce()
                self.unitMetric = Gram()
            case is Temperature:
                self.unitImperial = Fahreight()
                self.unitMetric = Celsius()
            default:
                break
            }
        }
    }
    
    private var unitImperial: UnitProtocol = Inch()
    private var unitMetric: UnitProtocol = Millimeter()
    
    var formatter: NumberFormatter {
        get {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.roundingMode = .halfUp
            formatter.decimalSeparator = ","
            formatter.groupingSeparator = " "
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = self.measurementType is Temperature ? 2 : 10
            return formatter
        }
    }
    
    mutating func changeConvertionDirection() {
        if convertionDirection == .ImperialToMetric {
            self.convertionDirection = .MetricToImperial
        }
        else {
            self.convertionDirection = .ImperialToMetric
        }
    }
    
    mutating func setUnitImperial(withIndex index: Int) {
        self.unitImperial = self.measurementType.unitsImperial[index]
    }
    
    mutating func setUnitMetric(withIndex index: Int) {
        self.unitMetric = self.measurementType.unitsMetric[index]
    }
    
    func calculateResult(_ number:Double) -> String {
        var result: Double = 0
        
        if self.convertionDirection == .ImperialToMetric {
            if self.measurementType is Temperature {
                result = ((unitImperial as? UnitTranslatedProtocol)?.translateWithFormula(number))!
            }
            else {
                result = number * unitImperial.translations[unitMetric.name]!
            }
        }
        else {
            if self.measurementType is Temperature {
                result = ((unitMetric as? UnitTranslatedProtocol)?.translateWithFormula(number))!
            }
            else {
                result = number * unitMetric.translations[unitImperial.name]!
            }
        }
        
        let resultString = formatter.string(from: NSNumber(value: result))!
        
        if resultString.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ",", with: "").replacingOccurrences(of: "-", with: "").characters.count > 11 {
            let newFormatter = self.formatter
            newFormatter.numberStyle = .scientific
            newFormatter.maximumFractionDigits = 4
            return newFormatter.string(from: NSNumber(value: result))!
        }
        
        return resultString
    }
}

