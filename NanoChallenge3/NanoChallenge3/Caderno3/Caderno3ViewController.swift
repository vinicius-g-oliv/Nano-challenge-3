//
//  Caderno3ViewController.swift
//  NanoChallenge3
//
//  Created by Vinicius Gomes on 19/04/22.
//

import UIKit

class Caderno3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    @IBOutlet weak var Novoregistro: UIButton!
    var modelo: [(title: String, anotacao: String, btndata: String)] = []
    let dataPicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "Matemática e Ciências da Natureza"
        
        
    }
    
    @IBAction func didTapNewNote() {
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? EntradaCaderno2 else {
            return
        }
        vc.title = "Novo Resultado"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { nota, anotacao, data in
            self.navigationController?.popViewController(animated: true)
            self.modelo.append((title: nota, anotacao: anotacao, btndata: data))
            self.label.isHidden = true
            self.table.isHidden = false
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // Table
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelo.count
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath)
       
        cell.textLabel?.text = modelo[indexPath.section].title
        cell.detailTextLabel?.text = modelo[indexPath.section].anotacao
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          modelo.remove(at: indexPath.section)
          tableView.deleteRows(at: [indexPath], with: .automatic)
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = modelo[indexPath.section]
        
        // Show note controller
        guard let vc = storyboard?.instantiateViewController(identifier: "note3") as? NoteViewController3 else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Resultados"
        vc.nota = model.title
        vc.anotacao = model.anotacao
        vc.data = model.btndata
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
}





