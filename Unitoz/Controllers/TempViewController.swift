//
//  TempViewController.swift
//  Unitoz
//
//  Created by Gayesha suraweera on 8/18/18.
//  Copyright © 2018 sliit. All rights reserved.
//

import UIKit

class TempViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var celsius: UITextField!
    @IBOutlet weak var fahrenheit: UITextField!
    @IBOutlet weak var kelvin: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        celsius.delegate = self
        fahrenheit.delegate = self
        kelvin.delegate = self
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(WeightViewController.disapearKeyboard))
        view.addGestureRecognizer(tap)
        celsius.addTarget(self, action: #selector(celsiusEditingDidChange), for: UIControlEvents.editingChanged)
        fahrenheit.addTarget(self, action: #selector(fahrenheitEditingDidChange), for: UIControlEvents.editingChanged)
        kelvin.addTarget(self, action: #selector(kelvinEditingDidChange), for: UIControlEvents.editingChanged)

    }
    //calls when tap the screen to disapear
    @objc func disapearKeyboard() {
        view.endEditing(true)
    }
    public  func SetupDecimals(_ numberToFormat:Double) -> String {
        let format = NumberFormatter()
        format.locale = Locale(identifier: "en_US_POSIX")
        format.maximumFractionDigits = 3
        format.minimumFractionDigits = 2
        
        return (format.string(for: numberToFormat))!
    }
    //editing change  event for celsius
    @objc private func celsiusEditingDidChange(_ textField: UITextField) {
        if textField.text != nil && textField.text != "" {
            let text =  textField.text
            let Doublevalue = Double("\(text!)")
            
            convertValue(Value: Doublevalue!, selectedType: TempUnits.Celcius.type())
        }
        else{
            clearFields()
        }
    }
    //editing change  event for fahrenheit
    @objc private func fahrenheitEditingDidChange(_ textField: UITextField) {
        if textField.text != nil && textField.text != "" {
            let text =  textField.text
            let Doublevalue = Double("\(text!)")
            
            convertValue(Value: Doublevalue!, selectedType: TempUnits.Fahrenheit.type())
        }
        else{
            clearFields()
        }
    }
    //editing change  event for kelvin
    @objc private func kelvinEditingDidChange(_ textField: UITextField) {
        if textField.text != nil && textField.text != "" {
            let text =  textField.text
            let Doublevalue = Double("\(text!)")
            
            convertValue(Value: Doublevalue!, selectedType: TempUnits.Kelvin.type())
        }
        else{
            clearFields()
        }
    }
    
    //unit convertion
    func convertValue(Value:Double,selectedType:String){
        var temps = TempConvertModel(kelvin: 0.00, celsius: 0.00, fahrenheit: 0.00)
        if(selectedType == TempUnits.Kelvin.type() ){
            temps.kelvin = Value
            temps = temps.convert(selectedUnit:selectedType)
            celsius.text = SetupDecimals(temps.celsius)
            fahrenheit.text = SetupDecimals(temps.fahrenheit)
        }
        else if(selectedType == TempUnits.Celcius.type()  ){
            temps.celsius = Value
            temps = temps.convert(selectedUnit:selectedType)
            kelvin.text = SetupDecimals(temps.kelvin)
            fahrenheit.text = SetupDecimals(temps.fahrenheit)
            
        }
        else {
            temps.fahrenheit = Value
            temps = temps.convert(selectedUnit:selectedType)
            kelvin.text = SetupDecimals(temps.kelvin)
            celsius.text = SetupDecimals(temps.celsius)
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
        
        self.celsius.text = ""
        self.fahrenheit.text = ""
        self.kelvin.text = ""
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
