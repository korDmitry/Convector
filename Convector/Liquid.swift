//
//  Liquid.swift
//  Convector
//
//  Created by Дмитрий Коробов on 11.08.17.
//  Copyright © 2017 Дмитрий Коробов. All rights reserved.
//

import Foundation

struct Liquid: TypeProtocol {
    var unitsImperial: [UnitProtocol] = [FluidOunce(), Cup(), Pint(), Quart(), Galon()]
    var unitsMetric: [UnitProtocol] = [Milliliter(), Liter()]
}

//MARK: - Imperial units

struct FluidOunce: UnitProtocol {
    var name: String = Units.fluidOunce
    var translations: Dictionary<String, Double> = [
        Units.milliliter : 29.5735,
        Units.liter : 0.0295735
    ]
}

struct Cup: UnitProtocol {
    var name: String = Units.cup
    var translations: Dictionary<String,Double> = [
        Units.milliliter : 236.588,
        Units.liter : 0.236588
    ]
}

struct Pint: UnitProtocol {
    var name: String = Units.pint
    var translations: Dictionary<String, Double> = [
        Units.milliliter : 473.176,
        Units.liter : 0.473176
    ]
}

struct Quart: UnitProtocol {
    var name: String = Units.quart
    var translations: Dictionary<String, Double> = [
        Units.milliliter : 946.353,
        Units.liter : 0.946353
    ]
}

struct Galon: UnitProtocol {
    var name: String = Units.galon
    var translations: Dictionary<String, Double> = [
        Units.milliliter : 3785.41,
        Units.liter : 3.78541
    ]
}

//MARK: - Metric units

struct Milliliter: UnitProtocol {
    var name: String = Units.milliliter
    var translations: Dictionary<String, Double> = [
        Units.fluidOunce : 0.033814,
        Units.cup : 0.00416667,
        Units.pint : 0.00211338,
        Units.quart : 0.00105669,
        Units.galon : 0.000264172
    ]
}

struct Liter: UnitProtocol {
    var name: String = Units.liter
    var translations: Dictionary<String, Double> = [
        Units.fluidOunce : 33.814,
        Units.cup : 4.16667,
        Units.pint : 2.11338,
        Units.quart : 1.05669,
        Units.galon : 0.264172
    ]
}
