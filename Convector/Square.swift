//
//  Square.swift
//  Convector
//
//  Created by Дмитрий Коробов on 11.08.17.
//  Copyright © 2017 Дмитрий Коробов. All rights reserved.
//

import Foundation

struct Square: TypeProtocol {
    var unitsImperial: [UnitProtocol] = [SquareInch(), SquareFoot(), SquareYard(), SquareMile()]
    var unitsMetric: [UnitProtocol] = [SquareMeter(), SquareKilometer()]
}

//MARK: - Imperial units

class SquareInch: UnitProtocol {
    var name: String = Units.squareInch
    var translations: Dictionary<String, Double> = [
        Units.squareMeter : 0.00064516,
        Units.squareKilometer : 6.4516e-10
    ]
}

class SquareFoot: UnitProtocol {
    var name: String = Units.squareFoot
    var translations: Dictionary<String, Double> = [
        Units.squareMeter : 0.092903,
        Units.squareKilometer : 9.2903e-8
    ]
}

class SquareYard: UnitProtocol {
    var name: String = Units.squareYard
    var translations: Dictionary<String, Double> = [
        Units.squareMeter : 0.836127,
        Units.squareKilometer : 8.3613e-7
    ]
}

class SquareMile: UnitProtocol {
    var name: String = Units.squareMile
    var translations: Dictionary<String, Double> = [
        Units.squareMeter : 2.59e+6,
        Units.squareKilometer : 2.58999
    ]
}

//MARK: - Metric units

class SquareMeter: UnitProtocol {
    var name: String = Units.squareMeter
    var translations: Dictionary<String, Double> = [
        Units.squareInch : 1550,
        Units.squareFoot : 10.7639,
        Units.squareYard : 1.19599,
        Units.squareMile : 3.861e-7
    ]
}

class SquareKilometer: UnitProtocol {
    var name: String = Units.squareKilometer
    var translations: Dictionary<String, Double> = [
        Units.squareInch : 1.55e+9,
        Units.squareFoot : 1.076e+7,
        Units.squareYard : 1.196e+6,
        Units.squareMile : 0.386102
    ]
}


