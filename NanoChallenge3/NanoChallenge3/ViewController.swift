//
//  ViewController.swift
//  NanoChallenge3
//
//  Created by Vinicius Gomes on 07/04/22.
//
import iCarousel
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnCaderno1: UIButton!
    
    @IBOutlet weak var btnCaderno3: UIButton!
    @IBOutlet weak var btnCaderno2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let titulo = "Your Test"
        title = titulo.uppercased()
        btnCaderno1.layer.cornerRadius = 12
        btnCaderno2.layer.cornerRadius = 12
        btnCaderno3.layer.cornerRadius = 12
    
    }


}

