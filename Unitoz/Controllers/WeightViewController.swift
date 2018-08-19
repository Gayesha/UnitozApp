//
//  WeightViewController.swift
//  Unitoz
//
//  Created by Gayesha suraweera on 8/18/18.
//  Copyright © 2018 sliit. All rights reserved.
//

import UIKit
import Foundation
class WeightViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var gram: UITextField!
    @IBOutlet weak var kilogram: UITextField!
    @IBOutlet weak var pound: UITextField!
    @IBOutlet weak var ounce: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gram.delegate = self
        kilogram.delegate = self
        pound.delegate = self
        ounce.delegate = self
        // Do any additional setup after loading the view.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(WeightViewController.disapearKeyboard))
        view.addGestureRecognizer(tap)
        gram.addTarget(self, action: #selector(gramEditingDidChange), for: UIControlEvents.editingChanged)
        kilogram.addTarget(self, action: #selector(kiloEditingDidChange), for: UIControlEvents.editingChanged)
        ounce.addTarget(self, action: #selector(ounceEditingDidChange), for: UIControlEvents.editingChanged)
        pound.addTarget(self, action: #selector(poundEditingDidChange), for: UIControlEvents.editingChanged)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    //calls when tap the screen to disapear
    @objc func disapearKeyboard() {
        view.endEditing(true)
    }
    //editing change  event for gram
    @objc private func gramEditingDidChange(_ textField: UITextField) {

        if textField.text != nil && textField.text != "" {
            let text =  textField.text
            let Doublevalue = Double("\(text!)")
            
            convertValue(Value: Doublevalue!, selectedType: WeightUnit.Gram.type())
        }
        else{
            clearFields()
        }
    }
    //editing change  event for kilo
    @objc private func kiloEditingDidChange(_ textField: UITextField) {
        if textField.text != nil && textField.text != "" {
            let text =  textField.text
            let Doublevalue = Double("\(text!)")
            
            convertValue(Value: Doublevalue!, selectedType: WeightUnit.Kilogram.type())
        }
        else{
            clearFields()
        }
    }
    //editing change  event for ounce
    @objc private func ounceEditingDidChange(_ textField: UITextField) {
        if textField.text != nil && textField.text != "" {
            let text =  textField.text
            let Doublevalue = Double("\(text!)")
            
            convertValue(Value: Doublevalue!, selectedType: WeightUnit.Ounce.type())
        }
        else{
            clearFields()
        }
    }
    //editing change  event for pound 
    @objc private func poundEditingDidChange(_ textField: UITextField) {
        if textField.text != nil && textField.text != "" {
            let text =  textField.text
            let Doublevalue = Double("\(text!)")
            
            convertValue(Value: Doublevalue!, selectedType: WeightUnit.Pound.type())
        }
        else{
            clearFields()
        }
    }
    public  func SetupDecimals(_ numberToFormat:Double) -> String {
        let fmt = NumberFormatter()
        fmt.locale = Locale(identifier: "en_US_POSIX")
        fmt.maximumFractionDigits = 3
        fmt.minimumFractionDigits = 2
      
        return (fmt.string(for: numberToFormat))!
    }
    //unit convertion
    func convertValue(Value:Double,selectedType:String){
        var weights = WeightConvertModel(gram: 0.0, kilogram: 0.0, ounce: 0.0, pound: 0.0)
        if(selectedType == WeightUnit.Pound.type() ){
            weights.pound = Value
            weights = weights.convert(selectedUnit:selectedType)
            kilogram.text = SetupDecimals(weights.kilogram)
            ounce.text = SetupDecimals(weights.ounce)
            gram.text = SetupDecimals(weights.gram)
            
        }
        else if(selectedType == WeightUnit.Ounce.type() ){
            weights.ounce = Value
            weights = weights.convert(selectedUnit:selectedType)
            kilogram.text = SetupDecimals(weights.kilogram)
            gram.text = SetupDecimals(weights.gram)
            pound.text = SetupDecimals(weights.pound)
            
        }
        else  if(selectedType == WeightUnit.Gram.type() ){
            weights.gram = Value
            weights = weights.convert(selectedUnit:selectedType)
            kilogram.text = SetupDecimals(weights.kilogram)
            ounce.text = SetupDecimals(weights.ounce)
            pound.text = SetupDecimals(weights.pound)
            
        }
        else{
            weights.kilogram = Value
            weights = weights.convert(selectedUnit:selectedType)
            ounce.text = SetupDecimals(weights.ounce)
            gram.text = SetupDecimals(weights.gram)
            pound.text = SetupDecimals(weights.pound)
        }
        
        
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        // Allow Only Valid Decimal Numbers
        if let textFieldText = textField.text   {
            
            let TextValue = (textFieldText as NSString).replacingCharacters(in: range, with: string)
            if Double(TextValue) != nil {
                return true
            }
        }
        return false
    }
    
    
    
    //clearing all text fields
    func clearFields(){
        
        self.gram.text = ""
        self.kilogram.text = ""
        self.pound.text = ""
        self.ounce.text = ""
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
