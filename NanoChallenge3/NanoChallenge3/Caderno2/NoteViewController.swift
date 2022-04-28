//
//  NoteViewController.swift
//  NanoChallenge3
//
//  Created by Higor Crisostomo on 27/04/22.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet weak var Acertos: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!
    @IBOutlet weak var Anotacao: UITextView!
    public var noteTitle: String = ""
    public var note: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        Anotacao.layer.cornerRadius = 10
        Acertos.layer.cornerRadius = 10
        titleLabel.text = noteTitle
        noteLabel.text = note
    }


}
