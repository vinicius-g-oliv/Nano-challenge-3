//
//  EntryViewController.swift
//  NanoChallenge3
//
//  Created by Higor Crisostomo on 27/04/22.
//

import UIKit

class EntryViewController: UIViewController {
    
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!

    public var completion: ((String, String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(didTapSave))
    }
    
    @objc func didTapSave() {
    
        if let Nota = titleField.text {
            if ((!Nota.isEmpty && noteField.text.isEmpty) || (!Nota.isEmpty && !noteField.text.isEmpty)) {
                completion?(Nota, noteField.text)
          
            }else {
                print("deu")
            }
        }
       }
    }


