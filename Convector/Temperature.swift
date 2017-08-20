//
//  Temperature.swift
//  Convector
//
//  Created by Дмитрий Коробов on 11.08.17.
//  Copyright © 2017 Дмитрий Коробов. All rights reserved.
//

import Foundation

struct Temperature: TypesProtocol {
    var unitsImperial: [UnitsProtocol] = [Fahreight()]
    var unitsMetric: [UnitsProtocol] = [Celsius()]
}

//MARK: Imperial 

class Fahreight: UnitsProtocol {
    var name: String = Units.fahrenheit
    var translations: Dictionary<String, Double> = [
        Units.celsius : 0
    ]
    func translateWithFormula(_ value: Double) -> Double {
        return (value - 32) * 5 / 9
    }
}

class Celsius: UnitsProtocol {
    var name: String = Units.celsius
    var translations: Dictionary<String, Double> = [
        Units.fahrenheit : 0
    ]
    func translateWithFormula(_ value: Double) -> Double {
        return value * 9 / 5 + 32
    }
}
