//
//  ViewController.swift
//  NanoChallenge3
//
//  Created by Vinicius Gomes on 07/04/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var birthDateTxt: UITextField!
    
    let datePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createDatePicker()
    }

    func createDatePicker(){
        
        birthDateTxt.textAlignment = .center
        
        //toolbar
        let  toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        //assign toolbar
        birthDateTxt.inputAccessoryView = toolbar
        
        //assign date picker to the text field
        birthDateTxt.inputView = datePicker
        
        //date picker mode
        datePicker.datePickerMode = .date
        
        //Tamanho do datePicker
        datePicker.preferredDatePickerStyle = .wheels
    }
    
    @objc func donePressed(){
        //formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        birthDateTxt.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}

