//
//  TempConvertModel.swift
//  Unitoz
//
//  Created by Gayesha Suraweera on 8/18/18.
//  Copyright © 2018 sliit. All rights reserved.
//

import Foundation
class TempConvertModel{
    
    //temperature unit types
    var kelvin:Double
    var celsius:Double
    var fahrenheit:Double
    
    
    //constructor
    init(kelvin: Double,celsius:Double,fahrenheit:Double) {
        
        self.kelvin = kelvin
        self.fahrenheit = fahrenheit
        self.celsius = celsius
        
    }
    //convert selected unit value into all units
    func convert(selectedUnit:String) -> TempConvertModel {
        
        if(selectedUnit == TempUnits.Kelvin.type()){
            let temp = self.kelvin
            self.celsius = temp - (273.15)
            self.fahrenheit = (temp * ( 9/5) ) - 459.67
            
        }
        else if(selectedUnit == TempUnits.Fahrenheit.type()){
            let temp = self.fahrenheit
            self.celsius = (temp - 32 ) / (9/5)
            self.kelvin = (temp  +  459.67) * 5/9
            
        }
        else {
            let temp = self.celsius
            self.fahrenheit = (temp * (9/5)) + 32
            self.kelvin = temp + 273.15
            
        }
        
        return self
        
    }
}
//get value of selected unit
enum TempUnits :String {
    case Kelvin, Fahrenheit ,Celcius
    
    func type()->String{
        return self.rawValue
        
    }
}
