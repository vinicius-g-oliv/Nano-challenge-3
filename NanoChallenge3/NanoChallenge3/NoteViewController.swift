//
//  NoteViewController.swift
//  NanoChallenge3
//
//  Created by Higor Crisostomo on 27/04/22.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet weak var Acertis: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!

    public var noteTitle: String = ""
    public var note: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        Acertis.layer.cornerRadius = 10
        titleLabel.text = noteTitle
        noteLabel.text = note
    }


}
