//
//  Units.swift
//  Convector
//
//  Created by Дмитрий Коробов on 10.08.17.
//  Copyright © 2017 Дмитрий Коробов. All rights reserved.
//

import Foundation

//MARK: Direction

enum Direction {
    case ImperialToMetric
    case MetricToImperial
}

//MARK: Protocols

protocol TypesProtocol {
    var unitsImperial: [UnitsProtocol] {get}
    var unitsMetric: [UnitsProtocol] {get}
}

@objc protocol UnitsProtocol {
    var name: String {get}
    var translations: Dictionary<String,Double> {get}
    @objc optional  func translateWithFormula(_ value: Double) -> Double 
}

//MARK: Units

enum Units {
    
    //Units: Length
    
    static let inch = "inch"
    static let foot = "foot"
    static let yard = "yard"
    static let mile = "mile"
    
    static let millimeter = "mm"
    static let centimeter = "cm"
    static let meter = "m"
    static let kilometer = "km"
    
    //Units: Square
    
    static let squareInch = "inch²"
    static let squareFoot = "foot²"
    static let squareYard = "yard²"
    static let squareMile = "mile²"
    
    static let squareMeter = "m²"
    static let squareKilometer = "km²"
    
    //Units: Volume
    
    static let cubicInch = "inch³"
    static let cubicFoot = "foot³"
    static let cubicYard = "yard³"
    static let cubicMile = "mile³"
    
    static let cubicMeter = "m³"
    static let cubicKilometer = "km³"
    
    //Units: Liquid
    
    static let fluidOunce = "fl oz"
    static let cup = "cup"
    static let pint = "pint"
    static let quart = "quart"
    static let galon = "galon"
    
    static let milliliter = "ml"
    static let liter = "l"
    
    //Units: Speed
    
    static let footPerSecond = "ft/s"
    static let milePerHour = "mph"
    
    static let meterPerSecond = "m/s"
    static let kilometerPerHour = "km/h"
    
    //Units: Weight
    
    static let ounce = "oz"
    static let pound = "lb"
    
    static let gram = "g"
    static let kilogram = "kg"
    static let ton = "ton"
    
    //Units: Temperature
    
    static let fahrenheit = "℉"
    
    static let celsius = "℃"
    
}
