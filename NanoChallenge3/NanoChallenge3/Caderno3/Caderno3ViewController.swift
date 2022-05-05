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
    @IBOutlet weak var filtro: UISegmentedControl!
    
    @IBAction func Filter(_ sender: UISegmentedControl) {
        sortBasedOnSegmentPressed()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sortBasedOnSegmentPressed()
    }
    
    var modelo: [(title: String, anotacao: String, btndata: String)] = []
    
    let dataPicker = UIDatePicker()
    
    override func viewDidLoad() {
        let nib  = UINib(nibName: "CustomCellTableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "CustomCellTableViewCell")
        super.viewDidLoad()
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "Matemática e Ciências da Natureza"
        table.reloadData()
        
        
    }
    
    @IBAction func didTapNewNote() {
        guard let vc = storyboard?.instantiateViewController(identifier: "new3") as? EntryViewController3 else {
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          modelo.remove(at: indexPath.section)
          tableView.deleteRows(at: [indexPath], with: .automatic)
      }
    
    
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }


    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellTableViewCell", for: indexPath) as! CustomCellTableViewCell
       
        cell.nota.text = modelo[indexPath.section].title
        cell.data.text = modelo[indexPath.section].btndata
       
        
        return cell
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
    // organizar
    func sortBasedOnSegmentPressed(){
            switch filtro.selectedSegmentIndex{
            case 0:
                ordemNota()
            case 1:
                ordemData()
            default: print("erro")
            }
        }
        
    
    func ordemNota(){
        modelo.sort { $0.title > $1.title }
          table.reloadData()
      }
      func ordemData(){
          modelo.sort { $0.btndata > $1.btndata }
          table.reloadData()
      }

}





