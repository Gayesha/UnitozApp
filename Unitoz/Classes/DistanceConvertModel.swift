//
//  DistanceConvertModel.swift
//  Unitoz
//
//  Created by Gayesha Suraweera on 8/18/18.
//  Copyright © 2018 sliit. All rights reserved.
//

import Foundation
class DistanceConvertModel{
    
    // unit types for distance
    var metre:Double
    var foot:Double
    var yard:Double
    var kilometre:Double
    var mile:Double
    
 
    //controller
    init(metre: Double,foot:Double,yard:Double,kilometre:Double,mile:Double) {
        
        self.metre = metre
        self.foot = foot
        self.yard = yard
        self.kilometre = kilometre
        self.mile = mile
    }
    
    //convert unit value to all units
    func convert(selectedUnitType:String) -> DistanceConvertModel {
        
        if(selectedUnitType == DistanceTypes.metre.type()){
            let distance = self.metre
            self.kilometre = distance * 0.001
            self.yard = distance * 1.0936132983
            self.mile = distance * 0.0006213712
            self.foot = distance  * 3.280839895
        }
        else if(selectedUnitType == DistanceTypes.kilometre.type()){
            let distance = self.kilometre
            self.metre = distance * 1000
            self.mile = distance * 0.6213711922
            self.yard = distance * 1093.6132983377
            self.foot = distance * 3280.8398950131
        }
        else if(selectedUnitType == DistanceTypes.yard.type()){
            let distance = self.yard
            self.foot = distance *  3
            self.metre = distance * 0.9144
            self.mile = distance * 0.0005681818
            self.kilometre = distance * 0.0009144
        }
        else if(selectedUnitType == DistanceTypes.mile.type()){
            let distance = self.mile
            self.kilometre = distance *  1.609344
            self.foot = distance * 5280
            self.metre = distance * 1609.344
            self.yard = distance * 1760
        }
        else{
            let distance = self.foot
            self.yard = distance / 3
            self.kilometre = distance * 0.0003048
            self.metre = distance * 0.3048
            self.mile = distance * 0.0001893939
        }
        return self
        
    }
}
//get value for the selected unit
enum DistanceTypes :String {
    case foot, mile ,metre,kilometre,yard
    
    func type()->String{
        return self.rawValue
        
    }
}
