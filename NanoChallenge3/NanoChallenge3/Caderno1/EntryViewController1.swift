//
//  EntryViewController1.swift
//  NanoChallenge3
//
//  Created by Higor Crisostomo
//  Vinicius Gomes
//  Guilherme 
//

import UIKit

class EntryViewController1: UIViewController {
    
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!

    public var completion: ((String, String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        noteField.layer.cornerRadius = 10
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(didTapSave))
    }
    
    
    @objc func didTapSave() {
    
        if let Nota = titleField.text {
            if ((!Nota.isEmpty && noteField.text.isEmpty) || (!Nota.isEmpty && !noteField.text.isEmpty)) {
                let Converter:Int? = Int(titleField.text!)
                if (Converter! <= 90 && Converter! >= 0) {
                    completion?(Nota, noteField.text)
                }else{
                    let alert = UIAlertController(title: "Atenção", message: "Preencha o campo com valor menor que ou igual a 90", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    present(alert, animated: true)
                }
            }
            else
            {
                
                let alert = UIAlertController(title: "Atenção", message: "Preencha o campo acertos", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                present(alert, animated: true)
            }
         
           }
        }


}
