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
        
        
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(didTapSave))
    }
    
    @objc func didTapSave() {
        if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty {
           completion?(text, noteField.text)
        }
    }


}
