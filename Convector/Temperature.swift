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

struct Fahreight: UnitsProtocol {
    var name: String = Units.fahrenheit
    var translations: Dictionary<String, Double> = [
        Units.celsius : 0
    ]
}

struct Celsius: UnitsProtocol {
    var name: String = Units.celsius
    var translations: Dictionary<String, Double> = [
        Units.fahrenheit : 0
    ]
}
