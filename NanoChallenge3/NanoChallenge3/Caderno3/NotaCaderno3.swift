//
//  NoteViewController3.swift
//  NanoChallenge3
//
//  Created by Higor Crisostomo on 28/04/22.
//

import UIKit

class NotaCaderno3: UIViewController, UITextViewDelegate {
    @IBOutlet var campoNota: UILabel!
    @IBOutlet var campoAnotacao: UITextView!
    @IBOutlet weak var campoData: UILabel!
    @IBOutlet weak var Acertos: UIView!
    @IBOutlet weak var Campodata: UIView!
    @IBOutlet weak var Anotacao: UITextView!
    public var nota: String = ""
    public var anotacao: String = ""
    public var data: String = ""
    public var indice: Int = 0
    public var delegate: atualizarRegistroCaderno3?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        campoAnotacao.delegate = self
        campoData.text = data
        campoNota.text = nota
        campoAnotacao.text = anotacao
        Campodata.layer.cornerRadius = 10
        Anotacao.layer.cornerRadius = 10
        Acertos.layer.cornerRadius = 10
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Atualizar", style: .done, target: self, action: #selector(didTapSave))
     
    }
  
  
    @objc func didTapSave() {

        delegate?.atualizar(campoAnotacao.text ?? "", indice)
        let alert = UIAlertController(title: "Atualização", message: "Os dados foram atualizados", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {_ in
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true)
       
        return
        
        
    }

}
    

