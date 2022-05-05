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
   
    
    
    var modelo: [(title: String, anotacao: String, btndata: String)] = []
    let dataPicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "Linguagens Ciências Humanas Espanhol"
        
        
    }
    
    @IBAction func didTapNewNote() {
        guard let vc = storyboard?.instantiateViewController(identifier: "new1") as? EntradaCaderno1 else {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
       
        cell.textLabel?.text = modelo[indexPath.section].title
        cell.detailTextLabel?.text = modelo[indexPath.section].anotacao
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = modelo[indexPath.section]
        
        
        // Show note controller
        guard let vc = storyboard?.instantiateViewController(identifier: "note1") as? NoteViewController1 else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Resultados"
        vc.nota = model.title
        vc.data = model.btndata
        vc.anotacao = model.anotacao
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    private func tableView(_ tableView: UITableViewCell, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
//
//    private func tableView(_ tableView: UITableViewCell,editingStyle: UITableViewCell.editingStyle, forRowAt indexPath:IndexPath){
//        <#code#>
//    }
    //
    
    
    
}




