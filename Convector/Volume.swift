//
//  Volume.swift
//  Convector
//
//  Created by Дмитрий Коробов on 18.08.17.
//  Copyright © 2017 Дмитрий Коробов. All rights reserved.
//

import Foundation

struct Volume: TypesProtocol {
    var unitsImperial: [UnitsProtocol] = [CubicInch(), CubicFoot()]
    var unitsMetric: [UnitsProtocol] = [CubicMeter()]
}

//MARK: - Imperial units

class CubicInch: UnitsProtocol {
    var name: String = Units.cubicInch
    var translations: Dictionary<String, Double> = [
        Units.cubicMeter : 1.6387e-5
    ]
}

class CubicFoot: UnitsProtocol {
    var name: String = Units.cubicFoot
    var translations: Dictionary<String, Double> = [
        Units.cubicMeter : 0.0283168
    ]
}

//MARK: - Metric units

class CubicMeter: UnitsProtocol {
    var name: String = Units.cubicMeter
    var translations: Dictionary<String, Double> = [
        Units.cubicInch : 61023.7,
        Units.cubicFoot : 35.3147
    ]
}
