//
//  NoteViewController1.swift
//  NanoChallenge3
//
//  Created by Higor Crisostomo on 28/04/22.
//

import UIKit

class NoteViewController1: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!

    @IBOutlet weak var Acertos: UIView!
    @IBOutlet weak var Anotacao: UITextView!
    public var noteTitle: String = ""
    public var note: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = noteTitle
        noteLabel.text = note
        Anotacao.layer.cornerRadius = 10
        Acertos.layer.cornerRadius = 10
    }


}

