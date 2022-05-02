//
//  Caderno1ViewController.swift
//  NanoChallenge3
//
//  Created by Vinicius Gomes on 18/04/22.
//

import UIKit

class Caderno1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var Novoregistro: UIButton!
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    var models: [(title: String, note: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "Linguagens Ciências Humanas Espanhol"
        
        
    }
    
    @IBAction func didTapNewNote() {
        guard let vc = storyboard?.instantiateViewController(identifier: "new1") as? EntryViewController1 else {
            return
        }
        vc.title = "Novo Resultado"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { noteTitle, note in
            self.navigationController?.popViewController(animated: true)
            self.models.append((title: noteTitle, note: note))
            self.label.isHidden = true
            self.table.isHidden = false
            
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // Table
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, numbersOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
       
        cell.textLabel?.text = models[indexPath.section].title
        cell.detailTextLabel?.text = models[indexPath.section].note
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = models[indexPath.section]
        
        
        // Show note controller
        guard let vc = storyboard?.instantiateViewController(identifier: "note1") as? NoteViewController1 else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Resultados"
        vc.noteTitle = model.title
        vc.note = model.note
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
}




