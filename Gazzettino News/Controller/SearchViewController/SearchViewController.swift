//
//  RicercaVC.swift
//  newsAlamofire
//
//  Created by Massimiliano on 13/06/2019.
//  Copyright © 2019 Massimiliano Bonafede. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, MainCoordinated, NewsManagerDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var cityPicker: UIPickerView!
    @IBOutlet weak var ricercaBtn: UIButton!
    
    
    //MARK: - Properties
    var mainCoordinator: MainCoordinator?
    var newManager: NewsManager?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityPicker.delegate = self
        cityPicker.dataSource = self
        cityPicker.setValue(UIColor.white, forKey: "textColor") 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        mainCoordinator?.configure(viewController: segue.destination)
    }
    
    //MARK: - Actions
    
    @IBAction func ricercaBtnWasPressed(_ sender: Any) {
        if newManager?.inizialeCittà == nil && newManager?.nomeCittà == nil {
            newManager?.inizialeCittà = newManager?.citiesContainer[cityPicker.selectedRow(inComponent: 0)].inizial
            newManager?.nomeCittà = newManager?.citiesContainer[cityPicker.selectedRow(inComponent: 0)].rawValue
        }
        
        mainCoordinator?.searchForNewsDidPressed(self)
    }
}


extension SearchViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return newManager?.citiesContainer.count ?? 0
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return newManager?.citiesContainer[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        newManager?.inizialeCittà = newManager?.citiesContainer[row].inizial
        newManager?.nomeCittà = newManager?.citiesContainer[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var pickerLabel: UILabel? = (view as? UILabel)
        
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "Avenir", size: 30)
            pickerLabel?.textAlignment = .center
        }
        
        pickerLabel?.text = newManager?.citiesContainer[row].rawValue
        pickerLabel?.textColor = UIColor.white
        
        return pickerLabel!
    }
    
}


