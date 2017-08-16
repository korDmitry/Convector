//
//  Units.swift
//  Convector
//
//  Created by Дмитрий Коробов on 10.08.17.
//  Copyright © 2017 Дмитрий Коробов. All rights reserved.
//

import Foundation

//MARK: Protocols

protocol TypesProtocol {
    var unitsImperial: [UnitsProtocol] {get}
    var unitsMetric: [UnitsProtocol] {get}
}

protocol UnitsProtocol {
    var name: String {get}
    var translations: Dictionary<String,Double> {get}
}

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
    
    //Units: Liquid
    
    static let fluidOunce = "fl oz"
    static let cup = "cup"
    static let pint = "pint"
    static let quart = "quart"
    static let galon = "galon"
    
    static let milliliter = "ml"
    static let liter = "l"
    
    //Units: Weight
    
    static let ounce = "ounce"
    static let pound = "pound"
    
    static let gram = "g"
    static let kilogram = "kg"
    static let ton = "ton"
    
    //Units: Temperature
    
    static let fahrenheit = "℉"
    
    static let celsius = "℃"
    
}
