//
//  RicercaVC.swift
//  newsAlamofire
//
//  Created by Massimiliano on 13/06/2019.
//  Copyright © 2019 Massimiliano Bonafede. All rights reserved.
//

import UIKit

class RicercaVC: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    @IBOutlet weak var testLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var cityPicker: UIPickerView!
    @IBOutlet weak var ricercaBtn: UIButton!
    
    
    var letteraRegione : String?
    var nomeRegione : String?
    
    let pickerData = ["------------","EMIRATI ARABI UNITI","ARGENTINA","AUSTRIA","AUSTRALIA","BELGIO","BULGARIA","BRASILE","CANADA","CINA","CUBA","GERMANIA","EGITTO","FRANCIA","GRAN BRETAGNA","GRECIA","HONG KONG","IRLANDA","INDIA","ITALIA","GIAPPONE","OLANDA","NORVEGIA","NUOVA ZELANDA","FILIPPINE","RUSSIA","TAILANDIA","STATI UNITI D'AMERICA","SUD AFRICA"].sorted()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // overrideUserInterfaceStyle is available with iOS 13
        if #available(iOS 13.0, *) {
            // Always adopt a light interface style.
            overrideUserInterfaceStyle = .light
        }
        
        cityPicker.delegate = self
        cityPicker.dataSource = self
        cityPicker.setValue(UIColor.white, forKey: "textColor")
        ricercaBtn.isHidden = true
        
    }
    
    
    func risultato(citta : String){
        if citta == "" || citta == "Unknow"{
            ricercaBtn.isHidden = true
        } else {
            ricercaBtn.isHidden = false
        }
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        letteraRegione = getStateID(nomeCitta: testLbl.text!)
        cityLbl.text = letteraRegione
        
        
        testLbl.text = pickerData[row]
        nomeRegione = pickerData[row]
        ricercaBtn.isHidden = false
        
        if getStateID(nomeCitta: testLbl.text!) == "Unknow" || getStateID(nomeCitta: testLbl.text!) == ""{
            ricercaBtn.isHidden = true
        } else {
            ricercaBtn.isHidden = false
        }
        
        
        
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "Avenir", size: 30)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = pickerData[row]
        pickerLabel?.textColor = UIColor.white
        
        return pickerLabel!
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "news" {
            let viewController = segue.destination as! NewsVC
            viewController.inizialeCitta = getStateID(nomeCitta: testLbl.text!)
            viewController.nomeCitta = nomeRegione
        }
    }
    
    
    @IBAction func ricercaBtnWasPressed(_ sender: Any) {
        performSegue(withIdentifier: "news", sender: letteraRegione)
        performSegue(withIdentifier: "news", sender: nomeRegione)
    }
    
    
    func getStateID(nomeCitta : String) -> String{
        switch nomeCitta {
            
        case "EMIRATI ARABI UNITI":
            return "ae"
        case "ARGENTINA":
            return "ar"
        case "AUSTRIA":
            return "at"
        case "AUSTRALIA":
            return "au"
        case "BELGIO":
            return "be"
        case "BULGARIA":
            return "bg"
        case "BRASILE":
            return "br"
        case "CANADA":
            return "ca"
        case "CINA":
            return "cn"
        case "CUBA":
            return "cu"
        case "GERMANIA":
            return "de"
        case "EGITTO":
            return "eg"
        case "FRANCIA":
            return "fr"
        case "GRAN BRETAGNA":
            return "gb"
        case "GRECIA":
            return "gr"
        case "HONG KONG":
            return "hk"
        case "IRLANDA":
            return "ie"
        case "INDIA":
            return "in"
        case "ITALIA":
            return "it"
        case "GIAPPONE":
            return "jp"
        case "OLANDA":
            return "nl"
        case "NORVEGIA":
            return "no"
        case "NUOVA ZELANDA":
            return "nz"
        case "FILIPPINE":
            return "ph"
        case "RUSSIA":
            return "ru"
        case "TAILANDIA":
            return "th"
        case "STATI UNITI D'AMERICA":
            return "us"
        case "SUD AFRICA":
            return "za"
        case "------------":
            return "Unknow"
        default:
            return "unknow"
            
        }
    }
    
}


