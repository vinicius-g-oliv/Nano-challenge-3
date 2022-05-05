//
//  EntryViewController.swift
//  NanoChallenge3
//
//  Created by Higor Crisostomo on 27/04/22.
//

import UIKit

class EntradaCaderno2: UIViewController {
    
    @IBOutlet weak var escolherData: UITextField!
    @IBOutlet var campoNota: UITextField!
    @IBOutlet var campoAnotacao: UITextView!
    
    let datePicker = UIDatePicker()
    
    public var completion: ((String, String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        campoAnotacao.layer.cornerRadius = 10
        campoNota.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .plain, target: self, action: #selector(didTapSave))
        createDatePicker()
    }
    func createDatePicker(){
        
        escolherData.textAlignment = .justified
        
        //toolbar
        let  toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // bar button
        let salvar = UIBarButtonItem(title: "Salvar", style: .plain, target: nil, action: #selector(donePressed))
        let espaco = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([espaco,salvar], animated: true)
        
        //assign toolbar
        escolherData.inputAccessoryView = toolbar
        
        //assign date picker to the text field
        escolherData.inputView = datePicker
        
        //date picker mode
        datePicker.datePickerMode = .date
        
        //Tamanho do datePicker
        datePicker.preferredDatePickerStyle = .inline
    }
    
    @objc func donePressed(){
        //formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        escolherData.text = formatter.string(from: self.datePicker.date)
        self.view.endEditing(true)
    }
    
    
    @objc func didTapSave() {
        
        if let Nota = campoNota.text {
            if ((!Nota.isEmpty && campoAnotacao.text.isEmpty) || (!Nota.isEmpty && !campoAnotacao.text.isEmpty)) {
                let Converter:Int? = Int(campoNota.text!)
                if (Converter! <= 90 && Converter! >= 0) {
                    guard let data = escolherData.text, !data.isEmpty else {
                        let data = ""
                        let alert = UIAlertController(title: "Atenção", message: "Campo data vazio", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        present(alert, animated: true)
                        completion?(Nota, campoAnotacao.text, data)
                        return
                    }
                    completion?(Nota, campoAnotacao.text, data)
                }else{
                    let alert = UIAlertController(title: "Atenção", message: "Preencha o campo com valor menor que ou igual a 90", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    present(alert, animated: true)
                }
            }
            else
            {
                
                let alert = UIAlertController(title: "Atenção", message: "Preencha o campo acertos e data", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                present(alert, animated: true)
            }
            
        }
    }
    
}
