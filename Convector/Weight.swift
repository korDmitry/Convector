//
//  Weight.swift
//  Convector
//
//  Created by Дмитрий Коробов on 11.08.17.
//  Copyright © 2017 Дмитрий Коробов. All rights reserved.
//

import Foundation

struct Weight: TypeProtocol {
    var unitsImperial: [UnitProtocol] = [Ounce(), Pound()]
    var unitsMetric: [UnitProtocol] = [Gram(), Kilogram(), Ton()]
}

//MARK: - Imperial units

struct Ounce: UnitProtocol {
    var name: String = Units.ounce
    var translations: Dictionary<String, Double> = [
        Units.gram : 28.3495,
        Units.kilogram : 0.0283495,
        Units.ton : 2.835e-5
    ]
}

struct Pound: UnitProtocol {
    var name: String = Units.pound
    var translations: Dictionary<String, Double> = [
        Units.gram : 453.592,
        Units.kilogram : 0.453592,
        Units.ton : 0.000453592
    ]
}

//MARK: - Metric units

struct Gram: UnitProtocol {
    var name: String = Units.gram
    var translations: Dictionary<String, Double> = [
        Units.ounce : 0.035274,
        Units.pound : 0.00220462
    ]
}

struct Kilogram: UnitProtocol {
    var name: String = Units.kilogram
    var translations: Dictionary<String, Double> = [
        Units.ounce : 35.274,
        Units.pound : 2.20462
    ]
}

struct Ton: UnitProtocol {
    var name: String = Units.ton
    var translations: Dictionary<String, Double> = [
        Units.ounce : 35274,
        Units.pound : 2204.62
    ]
}
