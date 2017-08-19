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
    var measurementType: TypesProtocol = Length() {
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
    
    private var unitImperial: UnitsProtocol = Inch()
    private var unitMetric: UnitsProtocol = Millimeter()
    
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
    
    func calculateResult(_ value:Double) -> (Double) {
        if self.convertionDirection == .ImperialToMetric {
            return value * unitImperial.translations[unitMetric.name]!
        }
        else {
            return value * unitMetric.translations[unitImperial.name]!
        }
    }
}


