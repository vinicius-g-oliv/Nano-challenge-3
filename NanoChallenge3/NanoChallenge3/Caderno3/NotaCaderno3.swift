//
//  NoteViewController3.swift
//  NanoChallenge3
//
//  Created by Higor Crisostomo on 28/04/22.
//

import UIKit
let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
class NotaCaderno3: UIViewController, UITextViewDelegate {
    override func viewWillAppear(_ animated: Bool) {
        campoAnotacao.text = anotacao
        print(anotacao)
    }
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
    public var delegate: atualizarRegistro?
    
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

        delegate?.execute(campoAnotacao.text ?? "", indice)
        let alert = UIAlertController(title: "Atualização", message: "Os dados foram atualizados ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
            return
        
        
    }

}
    

