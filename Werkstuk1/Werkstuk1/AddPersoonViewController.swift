//
//  AddPersoonViewController.swift
//  Werkstuk1
//
//  Created by student on 07/04/2019.
//  Copyright © 2019 student. All rights reserved.
//

// James Leist. Stop segue and show alert if text box is empty. Geraadpleegd via
// http://jamesleist.com/ios-swift-tutorial-stop-segue-show-alert-text-box-empty/
// Geraadpleegd op 7 april 2019

// Reinder de Vries. How To: Displaying Alerts With UIAlertController In Swift. Geraadpleegd via
// https://learnappmaking.com/uialertcontroller-alerts-swift-how-to/
// Geraadpleegd op 7 april 2019

// Dennis Walsh. Regular Expressions in Swift. Geraadpleegd via
// https://medium.com/@dkw5877/regular-expressions-in-swift-928561ad55c8
// Geraadpleegd op 7 april 2019

import UIKit

class AddPersoonViewController: UIViewController {

    var itemAdd: Persoon = Persoon()
    
    //Textfields voor persoon aan te maken
    @IBOutlet weak var tfVoornaam: UITextField!
    
    @IBOutlet weak var tfAchternaam: UITextField!
    
    @IBOutlet weak var tfTelefoonnummer: UITextField!
    
    @IBOutlet weak var tfStraat: UITextField!
    
    @IBOutlet weak var tfHuisnr: UITextField!
    
    @IBOutlet weak var tfGemeente: UITextField!
    
    @IBOutlet weak var tfPostcode: UITextField!
    
    //Error labels
    @IBOutlet weak var errorVoornaam: UILabel!
    
    @IBOutlet weak var errorAchternaam: UILabel!
    
    @IBOutlet weak var errorTelefoonnummer: UILabel!
    
    @IBOutlet weak var errorStraat: UILabel!
    
    @IBOutlet weak var errorHuisnr: UILabel!
    
    @IBOutlet weak var errorGemeente: UILabel!
    
    @IBOutlet weak var errorPostcode: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Validatie invoer persoon
    func Validate() -> Bool
    {
        errorVoornaam.isHidden = true
        errorAchternaam.isHidden = true
        errorTelefoonnummer.isHidden = true
        errorStraat.isHidden = true
        errorHuisnr.isHidden = true
        errorGemeente.isHidden = true
        errorPostcode.isHidden = true
        
        var check = true
        
        //Validate voornaam
        if ((tfVoornaam.text?.isEmpty)!) {
            errorVoornaam.isHidden = false
            errorVoornaam.text = "Voornaam is niet ingevuld!"
            check = false
        }
        
        //validate achternaam
        if ((tfAchternaam.text?.isEmpty)!) {
            errorAchternaam.isHidden = false
            errorAchternaam.text = "Achternaam is niet ingevuld!"
            check = false
        }
        
        //validate telefoonnummer
        let PHONE_REGEX = "^[0-9]{9}|[0-9]{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let resultTelefoonnr =  phoneTest.evaluate(with: tfTelefoonnummer.text)
        
        if ((tfTelefoonnummer.text?.isEmpty)!) {
            errorTelefoonnummer.isHidden = false
            errorTelefoonnummer.text = "Telefoonnummer is niet ingevuld!"
            check = false
            
        }
        else if (resultTelefoonnr == false) {
            errorTelefoonnummer.isHidden = false
            errorTelefoonnummer.text = "Telefoonnummer is niet juist!"
            check = false

        }
        
        //Validate straat
        if ((tfStraat.text?.isEmpty)!) {
            errorStraat.isHidden = false
            errorStraat.text = "Straat is niet ingevuld!"
            check = false
        }
        
        //Validate huisnummer
        let HNR_REGEX = "^([1-9]|[1-9][0-9]|[1-9][0-9][0-9]|999)$"
        let hnrTest = NSPredicate(format: "SELF MATCHES %@", HNR_REGEX)
        let resultHuisnr =  hnrTest.evaluate(with: tfHuisnr.text)
        
        if ((tfHuisnr.text?.isEmpty)!) {
            errorHuisnr.isHidden = false
            errorHuisnr.text = "Huisnummer is niet ingevuld!"
            check = false
        }
        else if (resultHuisnr == false) {
            errorHuisnr.isHidden = false
            errorHuisnr.text = "Huisnummer moet tussen 1 en 999!"
            check = false
        }
        
        //Validate gemeente
        if ((tfGemeente.text?.isEmpty)!) {
            errorGemeente.isHidden = false
            errorGemeente.text = "Gemeente is niet ingevuld!"
            check = false
        }
        
        //Validate postcode
        let PC_REGEX = "^([1-9][0-9][0-9][0-9]|9999)$"
        let pstcodeTest = NSPredicate(format: "SELF MATCHES %@", PC_REGEX)
        let resultPostcode =  pstcodeTest.evaluate(with: tfPostcode.text)
        
        if ((tfPostcode.text?.isEmpty)!) {
            errorPostcode.isHidden = false
            errorPostcode.text = "Postcode is niet ingevuld!"
            check = false
        }
        else if (resultPostcode == false) {
            errorPostcode.isHidden = false
            errorPostcode.text = "Postcode moet tussen 1000 en 9999!"
            check = false
        }
        
        return check
    }
    
    // MARK: - Navigation
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "addSegue" {
            //code
        }
    }
    */
    
    //Segue Blocking door validatie
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "addSegue" {
            
            if (Validate() == false) {
                let alert = UIAlertController(title: "Error", message: "Sommige velden zijn niet of incorrect ingevuld!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                
                self.present(alert, animated: true)
                return false
            }
                
            else {
                let latitude = Float.random(in: 50...54)
                let longitude = Float.random(in: 3...6)
                print("\(latitude), \(longitude)")
                
                itemAdd = Persoon(
                    naam: tfAchternaam.text!,
                    voornaam: tfVoornaam.text!,
                    foto: "user",
                    gpsCoordinaten: [Double(latitude), Double(longitude)],
                    telefoonnummer: tfTelefoonnummer.text!,
                    adres: Adres(
                        straat: tfStraat.text!,
                        huisnummer: Int(tfHuisnr.text!)!,
                        postcode: Int(tfPostcode.text!)!,
                        gemeente: tfGemeente.text!
                ))
                
                return true
            }
        }
        return true
    }
}
