//
//  WeightConvertModel.swift
//  Unitoz
//
//  Created by Gayesha Suraweera on 8/18/18.
//  Copyright © 2018 sliit. All rights reserved.
//

import Foundation

//get selected unit value

class WeightConvertModel{
    
    //weight units for selection
    var gram:Double
    var kilogram:Double
    var ounce:Double
    var pound:Double
    
   
    
    //constructor
    init(gram: Double,kilogram:Double,ounce:Double,pound:Double) {
        
        self.gram = gram
        self.kilogram = kilogram
        self.ounce = ounce
        self.pound = pound
    }
    
    //convert selected unit into all units
    func convert(selectedUnit:String) -> WeightConvertModel {
        
        if(selectedUnit == WeightUnit.Gram.type()){
            let weight = self.gram
            self.kilogram = weight / 1000
            self.ounce = weight / 28.34952
            self.pound = weight / 453.59237
        }
        else if(selectedUnit  == WeightUnit.Kilogram.type()){
            let weight = self.kilogram
            self.gram = weight * 1000
            self.ounce = weight / 0.02834952
            self.pound = weight / 0.45359237
        }
        else if(selectedUnit == WeightUnit.Ounce.type()){
            let weight = self.ounce
            self.gram = weight *  28.34952
            self.kilogram = weight * 0.02834952
            self.pound = weight / 16
        }
        else{
            let weight = self.pound
            self.gram = weight * 453.59237
            self.kilogram = weight * 0.45359237
            self.ounce = weight * 16
            
        }
        return self
        
    }
}
enum WeightUnit :String {
    case Gram, Kilogram ,Ounce ,Pound
    
    func type()->String{
        return self.rawValue
        
    }
}
