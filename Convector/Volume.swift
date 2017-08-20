//
//  Volume.swift
//  Convector
//
//  Created by Дмитрий Коробов on 18.08.17.
//  Copyright © 2017 Дмитрий Коробов. All rights reserved.
//

import Foundation

struct Volume: TypesProtocol {
    var unitsImperial: [UnitsProtocol] = [CubicInch(), CubicFoot(), CubicYard(), CubicMile()]
    var unitsMetric: [UnitsProtocol] = [CubicMeter(), CubicKilometer()]
}

//MARK: Imperial

class CubicInch: UnitsProtocol {
    var name: String = Units.cubicInch
    var translations: Dictionary<String, Double> = [
        Units.cubicMeter : 0,
        Units.cubicKilometer : 0
    ]
}

class CubicFoot: UnitsProtocol {
    var name: String = Units.cubicFoot
    var translations: Dictionary<String, Double> = [
        Units.cubicMeter : 0,
        Units.cubicKilometer : 0
    ]
}

class CubicYard: UnitsProtocol {
    var name: String = Units.cubicYard
    var translations: Dictionary<String, Double> = [
        Units.cubicMeter : 0,
        Units.cubicKilometer : 0
    ]
}

class CubicMile: UnitsProtocol {
    var name: String = Units.cubicMile
    var translations: Dictionary<String, Double> = [
        Units.cubicMeter : 0,
        Units.cubicKilometer : 0
    ]
}

//MARK: Metric

class CubicMeter: UnitsProtocol {
    var name: String = Units.cubicMeter
    var translations: Dictionary<String, Double> = [
        Units.cubicInch : 0,
        Units.cubicFoot : 0,
        Units.cubicYard : 0,
        Units.cubicMile : 0
    ]
}

class CubicKilometer: UnitsProtocol {
    var name: String = Units.cubicKilometer
    var translations: Dictionary<String, Double> = [
        Units.cubicInch : 0,
        Units.cubicFoot : 0,
        Units.cubicYard : 0,
        Units.cubicMile : 0
    ]
}
