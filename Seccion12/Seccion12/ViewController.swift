//
//  ViewController.swift
//  Prueba
//
//  Created by Daniel Escandell González on 16/05/2020.
//  Copyright © 2020 Daniel Escandell González. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myProgressIndicator: UIProgressView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myLabelOFF: UILabel!
    @IBOutlet weak var myLabelON: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    
    
    //Variables
    private let myPickerViewValues = ["UNO", "DOS", "TRES", "CUATRO", "CINCO", "SEIS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Buttons
        myButton.setTitle("UNO", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.black, for: .normal)
        
        //Pickers
        myPickerView.backgroundColor = .darkGray
        myPickerView.dataSource = self
        myPickerView.delegate = self
        myPickerView.isHidden = true
        
        //Pages
        myPageControl.numberOfPages = myPickerViewValues.count
        myPageControl.currentPageIndicatorTintColor = .blue
        myPageControl.pageIndicatorTintColor = .lightGray
        
        //Segmented Controls
        mySegmentedControl.removeAllSegments()
        for (index,value) in myPickerViewValues.enumerated() {
            mySegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
        }
        mySegmentedControl.selectedSegmentIndex = 0
        
        //Sliders
        mySlider.minimumValue = 1
        mySlider.maximumValue = Float(myPickerViewValues.count)
        mySlider.maximumTrackTintColor = .lightGray
        mySlider.value = 1
        
        //Steppers
        myStepper.minimumValue = 1
        myStepper.maximumValue = Double(myPickerViewValues.count)
        
        //Switchs
        mySwitch.onTintColor = .green
        mySwitch.isOn = false
        
        //Progress Activity
        myProgressIndicator.progress = 0
        
        //Activity Indicator
        myActivityIndicator.hidesWhenStopped = true
        myActivityIndicator.startAnimating()
        
        //Labels
        myLabelOFF.text = "OFF"
        myLabelOFF.isHidden = false
        myLabelON.text = "ON"
        myLabelON.isHidden = true
        
        //Text Fields
        myTextField.delegate = self
        myTextField.placeholder = "Escribe algo"
        myTextField.textColor = .lightGray
        
        //Text Views
        myTextView.textColor = .lightGray
        myTextView.delegate = self
        
    }
    
    //Actions
    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue {
                myButton.backgroundColor = .red
            
        }else {
            myButton.backgroundColor = .blue
            
        }
    }

    @IBAction func myPageControlAction(_ sender: Any) {
        myPickerView.selectRow(myPageControl.currentPage, inComponent: 0, animated: true)
        let mySring = myPickerViewValues[myPageControl.currentPage]
        myButton.setTitle(mySring, for: .normal)
        mySegmentedControl.selectedSegmentIndex = myPageControl.currentPage
        mySlider.setValue(Float(myPageControl.currentPage) + 1, animated: true)
        
    }
    
    @IBAction func mySegmentControlAction(_ sender: Any) {
        myPickerView.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
        myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
        let myString = myPickerViewValues[mySegmentedControl.selectedSegmentIndex]
        myButton.setTitle(myString, for: .normal)
        mySlider.setValue(Float(mySegmentedControl.selectedSegmentIndex) + 1, animated: true)
        
    }
    
    @IBAction func mySliderAction(_ sender: Any) {
        var progress: Float = 0
        
        switch mySlider.value {
        case 1..<2:
            mySegmentedControl.selectedSegmentIndex = 0
            myPageControl.currentPage = Int(mySlider.value) - 1
            myPickerView.selectRow(Int(mySlider.value) - 1, inComponent: 0, animated: true)
            let myString = myPickerViewValues[Int(mySlider.value) - 1]
            myButton.setTitle(myString, for: .normal)
            progress = 0.15
        case 2..<3:
            mySegmentedControl.selectedSegmentIndex = 1
            myPageControl.currentPage = Int(mySlider.value) - 1
            myPickerView.selectRow(Int(mySlider.value) - 1, inComponent: 0, animated: true)
            let myString = myPickerViewValues[Int(mySlider.value) - 1]
            myButton.setTitle(myString, for: .normal)
            progress = 0.30
        case 3..<4:
            mySegmentedControl.selectedSegmentIndex = 2
            myPageControl.currentPage = Int(mySlider.value) - 1
            myPickerView.selectRow(Int(mySlider.value) - 1, inComponent: 0, animated: true)
            let myString = myPickerViewValues[Int(mySlider.value) - 1]
            myButton.setTitle(myString, for: .normal)
            progress = 0.45
        case 4..<5:
            mySegmentedControl.selectedSegmentIndex = 3
            myPageControl.currentPage = Int(mySlider.value) - 1
            myPickerView.selectRow(Int(mySlider.value) - 1, inComponent: 0, animated: true)
            let myString = myPickerViewValues[Int(mySlider.value) - 1]
            myButton.setTitle(myString, for: .normal)
            progress = 0.60
        case 5..<6:
            mySegmentedControl.selectedSegmentIndex = 4
            myPageControl.currentPage = Int(mySlider.value) - 1
            myPickerView.selectRow(Int(mySlider.value) - 1, inComponent: 0, animated: true)
            let myString = myPickerViewValues[Int(mySlider.value) - 1]
            myButton.setTitle(myString, for: .normal)
            progress = 0.75
        default:
            mySegmentedControl.selectedSegmentIndex = 5
            myPageControl.currentPage = Int(mySlider.value) - 1
            myPickerView.selectRow(Int(mySlider.value) - 1, inComponent: 0, animated: true)
            let myString = myPickerViewValues[Int(mySlider.value) - 1]
            myButton.setTitle(myString, for: .normal)
            progress = 0.9
        }
        myProgressIndicator.progress = progress
        
    }
    @IBAction func myStepperAction(_ sender: Any) {
        mySlider.setValue(Float(myStepper.value), animated: true)
        mySegmentedControl.selectedSegmentIndex = Int(myStepper.value) - 1
        myPageControl.currentPage = Int(myStepper.value) - 1
        myPickerView.selectRow(Int(myStepper.value) - 1, inComponent: 0, animated: true)
        let myString = myPickerViewValues[Int(myStepper.value) - 1]
        myButton.setTitle(myString, for: .normal)
    }
    
    @IBAction func mySwitchControl(_ sender: Any) {
        if mySwitch.isOn == false {
            myPickerView.isHidden = true
            myLabelOFF.isHidden = false
            myLabelON.isHidden = true
            myActivityIndicator.startAnimating()
        }else {
            myPickerView.isHidden = false
            myLabelOFF.isHidden = true
            myLabelON.isHidden = false
            myActivityIndicator.stopAnimating()
        }
    }
    
    
    
}



//Exensions
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 //Columnas
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerViewValues.count //Elementos por columna
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerViewValues[row] //Titulo de cada columna
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //le damos una accion a cada seleccion
        let myString = myPickerViewValues[row]
        myButton.setTitle(myString, for: .normal)
        myPageControl.currentPage = row
        mySegmentedControl.selectedSegmentIndex = row
        mySlider.setValue(Float(row) + 1, animated: true)
        
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        myButton.setTitle(myTextField.text, for: .normal)
    }
    
}

extension ViewController: UITextViewDelegate {
     
}


