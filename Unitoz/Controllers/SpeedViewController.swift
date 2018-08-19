//
//  SpeedViewController.swift
//  Unitoz
//
//  Created by Gayesha Suraweera on 8/19/18.
//  Copyright © 2018 sliit. All rights reserved.
//

import UIKit

class SpeedViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var mps: UITextField!
    @IBOutlet weak var fpm: UITextField!
    @IBOutlet weak var mph: UITextField!
    @IBOutlet weak var kph: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        mps.delegate = self
        fpm.delegate = self
        mph.delegate = self
        kph.delegate = self
        // Do any additional setup after loading the view.
        // add tap GestureRecognizer
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SpeedViewController.disapearKeyboard))
        view.addGestureRecognizer(tap)
        mps.addTarget(self, action: #selector(mpsEditingDidChange), for: UIControlEvents.editingChanged)
        kph.addTarget(self, action: #selector(kphEditingDidChange), for: UIControlEvents.editingChanged)
        fpm.addTarget(self, action: #selector(fpmEditingDidChange), for: UIControlEvents.editingChanged)
        mph.addTarget(self, action: #selector(mphEditingDidChange), for: UIControlEvents.editingChanged)
    }

  
    
    
 //calls when tap the screen to disapear keyboard
    @objc func disapearKeyboard() {
      
        view.endEditing(true)
    }
    public  func SetupDecimals(_ numberToFormat:Double) -> String {
        let fmt = NumberFormatter()
        fmt.locale = Locale(identifier: "en_US_POSIX")
        fmt.maximumFractionDigits = 3
        fmt.minimumFractionDigits = 2
        
        return (fmt.string(for: numberToFormat))!
    }
    
    //editing change  event for mph
    @objc private func mphEditingDidChange(_ textField: UITextField) {
        if textField.text != nil && textField.text != "" {
            let text =  textField.text
            let Doublevalue = Double("\(text!)")
            
            convertValue(Value: Doublevalue!, selectedType: SpeedUnits.milePerHour.type())
        }
        else{
            clearFields()
        }
    }
    // editing change  event for kph
    @objc private func kphEditingDidChange(_ textField: UITextField) {
        if textField.text != nil && textField.text != "" {
            let text =  textField.text
            let Doublevalue = Double("\(text!)")
            
            convertValue(Value: Doublevalue!, selectedType: SpeedUnits.kiloPerHour.type())
        }
        else{
            clearFields()
        }
    }
    //editing change  event for fpm
    @objc private func fpmEditingDidChange(_ textField: UITextField) {
        if textField.text != nil && textField.text != "" {
            let text =  textField.text
            let Doublevalue = Double("\(text!)")
            
            convertValue(Value: Doublevalue!, selectedType: SpeedUnits.feetPerMin.type())
        }
        else{
            clearFields()
        }
    }
    // editing change  event for mps
    @objc private func mpsEditingDidChange(_ textField: UITextField) {
        if textField.text != nil && textField.text != "" {
            let text =  textField.text
            let Doublevalue = Double("\(text!)")
            
            convertValue(Value: Doublevalue!, selectedType:SpeedUnits.metrePerSec.type())
        }
        else{
            clearFields()
        }
    }
    
    //unit convertion
    func convertValue(Value:Double,selectedType:String){
        var speeds = SpeedConvertModel(metrePerSec: 0.00, kiloPerHour: 0.00, feetPerMin: 0.00, milePerHour: 0.00)
        if(selectedType == SpeedUnits.feetPerMin.type() ){
            speeds.feetPerMin = Value
            speeds = speeds.convert(selectedUnit:selectedType)
            kph.text = SetupDecimals(speeds.kiloPerHour)
            mps.text = SetupDecimals(speeds.metrePerSec)
            mph.text = SetupDecimals(speeds.milePerHour)
            
        }
        else if(selectedType == SpeedUnits.metrePerSec.type()  ){
            speeds.metrePerSec = Value
            speeds = speeds.convert(selectedUnit:selectedType)
            kph.text = SetupDecimals(speeds.kiloPerHour)
            mph.text = SetupDecimals(speeds.milePerHour)
            fpm.text = SetupDecimals(speeds.feetPerMin)
            
        }
        else  if(selectedType == SpeedUnits.kiloPerHour.type()  ){
            speeds.kiloPerHour = Value
            speeds = speeds.convert(selectedUnit:selectedType)
            mph.text = SetupDecimals(speeds.milePerHour)
            fpm.text = SetupDecimals(speeds.feetPerMin)
            mps.text = SetupDecimals(speeds.metrePerSec)
            
        }
        else{
            speeds.milePerHour = Value
            speeds = speeds.convert(selectedUnit:selectedType)
            fpm.text = SetupDecimals(speeds.feetPerMin)
            kph.text = SetupDecimals(speeds.kiloPerHour)
            mph.text = SetupDecimals(speeds.metrePerSec)
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
        
        self.mps.text = ""
        self.mph.text = ""
        self.kph.text = ""
        self.fpm.text = ""
       
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
