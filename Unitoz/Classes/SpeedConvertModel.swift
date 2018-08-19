//
//  SpeedConvertModel.swift
//  Unitoz
//
//  Created by Gayesha Suraweera on 8/18/18.
//  Copyright © 2018 sliit. All rights reserved.
//

import Foundation
class SpeedConvertModel{
    
    //speed unit types
    var milePerHour:Double
    var kiloPerHour:Double
    var feetPerMin:Double
    var metrePerSec:Double
    
    //get selected unit type
 
    //constructor
    init(metrePerSec: Double,kiloPerHour:Double,feetPerMin:Double,milePerHour:Double) {
        
        self.metrePerSec = metrePerSec
        self.kiloPerHour = kiloPerHour
        self.feetPerMin  = feetPerMin
        self.milePerHour = milePerHour
    }
    

    //convert selected unit value to all units
    func convert(selectedUnit:String) -> SpeedConvertModel {
        
        if(selectedUnit == SpeedUnits.metrePerSec.type()){
            let speed = self.metrePerSec
            self.kiloPerHour = speed  * 3.6
            self.feetPerMin = speed  * 196.8503937008
            self.milePerHour = speed  * 2.2369362921
        }
        else if(selectedUnit == SpeedUnits.kiloPerHour.type()){
            let speed = self.kiloPerHour
            self.metrePerSec = speed * 0.2777777778
            self.milePerHour = speed * 0.6213711922
            self.feetPerMin = speed  * 54.6806649169
        }
        else if(selectedUnit == SpeedUnits.feetPerMin.type()){
            let speed = self.feetPerMin
            self.metrePerSec = speed *  0.00508
            self.milePerHour = speed * 0.0113636364
            self.kiloPerHour = speed  * 0.018288
        }
        else{
            let speed = self.milePerHour
            self.kiloPerHour = speed * 1.609344
            self.metrePerSec = speed *  0.44704
            self.feetPerMin = speed * 88
            
        }
        return self
        
    }
}
enum SpeedUnits :String {
    case feetPerMin, milePerHour ,metrePerSec,kiloPerHour
    
    func type()->String{
        return self.rawValue
        
    }
}
