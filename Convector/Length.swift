//
//  Length.swift
//  Convector
//
//  Created by Дмитрий Коробов on 10.08.17.
//  Copyright © 2017 Дмитрий Коробов. All rights reserved.
//

import Foundation

struct Length: TypeProtocol {
    var unitsImperial: [UnitProtocol] = [Inch(), Foot(), Yard(), Mile()]
    var unitsMetric: [UnitProtocol] = [Millimeter(), Centimeter(), Meter(), Kilometer()]
}

//MARK: - Imperial units

class Inch: UnitProtocol {
    var name: String = Units.inch
    var translations: Dictionary<String,Double> = [
        Units.millimeter : 25.4,
        Units.centimeter : 2.54,
        Units.meter : 0.0254,
        Units.kilometer : 0.0000254
    ]
}

class Foot: UnitProtocol {
    var name: String = Units.foot
    var translations: Dictionary<String,Double> = [
        Units.millimeter : 304.8,
        Units.centimeter : 30.48,
        Units.meter : 0.3048,
        Units.kilometer : 0.0003048
    ]
}

class Yard: UnitProtocol {
    var name: String = Units.yard
    var translations: Dictionary<String,Double> = [
        Units.millimeter : 914.4,
        Units.centimeter : 91.44,
        Units.meter : 0.9144,
        Units.kilometer : 0.0009144
    ]
}

class Mile: UnitProtocol {
    var name: String = Units.mile
    var translations: Dictionary<String,Double> = [
        Units.millimeter : 1609340,
        Units.centimeter : 160934,
        Units.meter : 1609.34,
        Units.kilometer : 1.60934
    ]
}

//MARK: - Metric units

class Millimeter: UnitProtocol {
    var name: String = Units.millimeter
    var translations: Dictionary<String,Double> = [
        Units.inch : 0.0393701,
        Units.foot : 0.00328084,
        Units.yard : 0.00109361,
        Units.mile : 6.213693181818e-7
    ]
}

class Centimeter: UnitProtocol {
    var name: String = Units.centimeter
    var translations: Dictionary<String,Double> = [
        Units.inch : 0.393701,
        Units.foot : 0.0328084,
        Units.yard : 0.0109361,
        Units.mile : 6.213693181818e-6
    ]
}

class Meter: UnitProtocol {
    var name: String = Units.meter
    var translations: Dictionary<String,Double> = [
        Units.inch : 39.3701,
        Units.foot : 3.28084,
        Units.yard : 1.09361,
        Units.mile : 0.000621371
    ]
}

class Kilometer: UnitProtocol {
    var name: String = Units.kilometer
    var translations: Dictionary<String,Double> = [
        Units.inch : 39370.1,
        Units.foot : 3280.84,
        Units.yard : 1093.61,
        Units.mile : 0.621371
    ]
}
