//
//  ViewController.swift
//  NanoChallenge3
//
//  Created by Vinicius Gomes on 07/04/22.
//

import UIKit

class ViewController: UIViewController {
    
//    @IBOutlet var table: UITableView!
    
    @IBOutlet weak var btnCaderno1: UIButton!
    @IBOutlet weak var btnCaderno3: UIButton!
    @IBOutlet weak var btnCaderno2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let titulo = "Your Test"
        title = titulo.uppercased()
        
        btnCaderno1.layer.cornerRadius = 12
        //72C2FC
        btnCaderno2.layer.cornerRadius = 12
        //FFF27E
        btnCaderno3.layer.cornerRadius = 12
        //FF7577
    
    }

 
    
    
}

