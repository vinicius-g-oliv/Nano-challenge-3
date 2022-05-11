//
//  EntryViewController1.swift
//  NanoChallenge3
//
//  Created by Higor Crisostomo
//  Vinicius Gomes
//  Guilherme 
//

import UIKit

class EntradaCaderno1: UIViewController {
    
    
    @IBOutlet weak var escolherData: UITextField!
    @IBOutlet var campoNota: UITextField!
    @IBOutlet var campoAnotacoes: UITextView!
    let datePicker = UIDatePicker()

    public var completion: ((String, String, String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        donePressed()
        campoAnotacoes.layer.cornerRadius = 10
        campoNota.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(didTapSave))
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
        
        // *campoNota -> TextField de Acertos
        // *escolhaData -> TextField com DatePicker
        // campoAnotacao -> uitextView para anotação
        
        guard let nota = campoNota.text , !nota.isEmpty else {
            let alert = UIAlertController(title: "Atenção", message: "campo nota vazia", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        
        guard let data = escolherData.text , !data.isEmpty else {
            let alert = UIAlertController(title: "Atenção", message: "campo data vazia", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        let Converter:Int? = Int(campoNota.text!)
        if (Converter! <= 90 && Converter! >= 0) {
           
        } else {
            let alert = UIAlertController(title: "Atenção", message: "Digite um valor menor que 90 e maior que 0", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true)
                return
            }
            completion?(nota, data, campoAnotacoes.text)
        }
}
