//
//  DistanceViewController.swift
//  Unitoz
//
//  Created by  Gayesha suraweera on 8/19/18.
//  Copyright © 2018 sliit. All rights reserved.
//

import UIKit

class DistanceViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var metre: UITextField!
    @IBOutlet weak var foot: UITextField!
    @IBOutlet weak var yard: UITextField!
    @IBOutlet weak var km: UITextField!
    @IBOutlet weak var mile: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        metre.delegate = self
        foot.delegate = self
        yard.delegate = self
        km.delegate   = self
        mile.delegate = self
        
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(WeightViewController.disapearKeyboard))
        view.addGestureRecognizer(tap)
        metre.addTarget(self, action: #selector(metreEditingDidChange), for: UIControlEvents.editingChanged)
        foot.addTarget(self, action: #selector(footEditingDidChange), for: UIControlEvents.editingChanged)
        yard.addTarget(self, action: #selector(yardEditingDidChange), for: UIControlEvents.editingChanged)
        km.addTarget(self, action: #selector(kmEditingDidChange), for: UIControlEvents.editingChanged)
        mile.addTarget(self, action: #selector(mileEditingDidChange), for: UIControlEvents.editingChanged)
        
        // Do any additional setup after loading the view.
    }
    //editing change  event for metre
    @objc private func metreEditingDidChange(_ textField: UITextField) {
        if textField.text != nil && textField.text != "" {
            let text =  textField.text
            let Doublevalue = Double("\(text!)")
            
            convertValue(Value: Doublevalue!, selectedType: DistanceTypes.metre.type())
        }
        else{
            clearFields()
        }
    }
    // editing change  event for yard
    @objc private func yardEditingDidChange(_ textField: UITextField) {
        if textField.text != nil && textField.text != "" {
            let text =  textField.text
            let Doublevalue = Double("\(text!)")
            
            convertValue(Value: Doublevalue!, selectedType: DistanceTypes.yard.type())
        }
        else{
            clearFields()
        }
    }
    // editing change  event for kilometre
    @objc private func kmEditingDidChange(_ textField: UITextField) {
        if textField.text != nil && textField.text != "" {
            let text =  textField.text
            let Doublevalue = Double("\(text!)")
            
            convertValue(Value: Doublevalue!, selectedType: DistanceTypes.kilometre.type())
        }
        else{
            clearFields()
        }
    }
    //editing change  event for foot
    @objc private func footEditingDidChange(_ textField: UITextField) {
        if textField.text != nil && textField.text != "" {
            let text =  textField.text
            let Doublevalue = Double("\(text!)")
            
            convertValue(Value: Doublevalue!, selectedType: DistanceTypes.foot.type())
        }
        else{
            clearFields()
        }
    }
    //editing change  event for mile
    @objc private func mileEditingDidChange(_ textField: UITextField) {
        if textField.text != nil && textField.text != "" {
            let text =  textField.text
            let Doublevalue = Double("\(text!)")
            
            convertValue(Value: Doublevalue!, selectedType: DistanceTypes.mile.type())
        }
        else{
            clearFields()
        }
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
    //unit convertion
    func convertValue(Value:Double,selectedType:String){
        var distances = DistanceConvertModel(metre: 0.00, foot: 0.00, yard: 0.00, kilometre: 0.00, mile: 0.00)
        if(selectedType == DistanceTypes.metre.type() ){
            distances.metre = Value
            distances = distances.convert(selectedUnitType:selectedType)
            km.text = SetupDecimals(distances.kilometre)
            foot.text = SetupDecimals(distances.foot)
            yard.text = SetupDecimals(distances.yard)
            mile.text = SetupDecimals(distances.mile)
        }
        else if(selectedType == DistanceTypes.mile.type()  ){
            distances.mile = Value
            distances = distances.convert(selectedUnitType:selectedType)
            km.text = SetupDecimals(distances.kilometre)
            metre.text = SetupDecimals(distances.metre)
            foot.text = SetupDecimals(distances.foot)
            yard.text = SetupDecimals(distances.yard)
        }
        else  if(selectedType == DistanceTypes.yard.type() ){
            distances.yard = Value
            distances = distances.convert(selectedUnitType:selectedType)
            km.text = SetupDecimals(distances.kilometre)
            foot.text = SetupDecimals(distances.foot)
            mile.text = SetupDecimals(distances.mile)
            metre.text = SetupDecimals(distances.metre)
        }
        else  if(selectedType == DistanceTypes.foot.type() ){
            distances.foot = Value
            distances = distances.convert(selectedUnitType:selectedType)
            km.text = SetupDecimals(distances.kilometre)
            yard.text = SetupDecimals(distances.yard)
            mile.text = SetupDecimals(distances.mile)
            metre.text = SetupDecimals(distances.metre)
        }
        else{
            distances.kilometre = Value
            distances = distances.convert(selectedUnitType:selectedType)
            foot.text = SetupDecimals(distances.foot)
            metre.text = SetupDecimals(distances.metre)
            mile.text = SetupDecimals(distances.mile)
            yard.text = SetupDecimals(distances.yard)
            
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
        
        self.metre.text = ""
        self.foot.text = ""
        self.yard.text = ""
        self.mile.text = ""
        self.km.text   = ""
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
