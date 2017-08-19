//
//  Speed.swift
//  Convector
//
//  Created by Дмитрий Коробов on 18.08.17.
//  Copyright © 2017 Дмитрий Коробов. All rights reserved.
//

import Foundation

struct Speed: TypesProtocol {
    var unitsImperial: [UnitsProtocol] = [FootPerSecond(), MilePerHour()]
    var unitsMetric: [UnitsProtocol] = [MeterPerSecond(), KilometerPerHour()]
}

//MARK: Imperial

struct FootPerSecond: UnitsProtocol {
    var name: String = Units.footPerSecond
    var translations: Dictionary<String, Double> = [
        Units.meterPerSecond : 0.3048,
        Units.kilometerPerHour : 1.09728
    ]
}

struct MilePerHour: UnitsProtocol {
    var name: String = Units.milePerHour
    var translations: Dictionary<String, Double> = [
        Units.meterPerSecond : 0.44704,
        Units.kilometerPerHour : 1.609344
    ]
}

//MARK: Metric

struct MeterPerSecond: UnitsProtocol {
    var name: String = Units.meterPerSecond
    var translations: Dictionary<String, Double> = [
        Units.footPerSecond : 3.280840,
        Units.milePerHour : 2.236936
    ]
}

struct KilometerPerHour: UnitsProtocol {
    var name: String = Units.kilometerPerHour
    var translations: Dictionary<String, Double> = [
        Units.footPerSecond : 0.911344,
        Units.milePerHour : 0.621371
    ]
}
