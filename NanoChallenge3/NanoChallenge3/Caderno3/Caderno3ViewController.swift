//
//  Caderno3ViewController.swift
//  NanoChallenge3
//
//  Created by Vinicius Gomes on 19/04/22.
//

import UIKit

protocol atualizarRegistroCaderno3{
    func atualizar(_ anotacao: String, _ indice: Int)
}

class Caderno3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,atualizarRegistroCaderno3 {

    
    @IBOutlet var table: UITableView!
    @IBOutlet weak var filtro: UISegmentedControl!
    @IBAction func Filter(_ sender: UISegmentedControl) {
        sortBasedOnSegmentPressed()
    }
    
    var modelo: [RegistroCaderno3] = []
    let dataPicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modelo = lerRegistros()
        let nib  = UINib(nibName: "CustomCellCaderno3", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "CustomCellCaderno3")
        table.delegate = self
        table.dataSource = self
        title = "Matemática e Ciências da Natureza"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sortBasedOnSegmentPressed()
    }
    
    
        
    @IBAction func didTapNewNote() {
        guard let vc = storyboard?.instantiateViewController(identifier: "new3") as? EntradaCaderno3 else {
            return
        }
        vc.title = "Novo Resultado"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { nota ,data , anotacao in
            self.navigationController?.popViewController(animated: true)
            self.modelo.append(RegistroCaderno3(nota: nota, data: data, salvarAnotacao: anotacao))
            if let data = try? PropertyListEncoder().encode(self.modelo) {
                UserDefaults.standard.set(data, forKey: "itens3")
            }
            UserDefaults.standard.synchronize()
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    // Table
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = "Registros"
        return title
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelo.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellCaderno3", for: indexPath) as! CustomCellCaderno3
        
        cell.nota.text = modelo[indexPath.row].nota
        cell.data.text = modelo[indexPath.row].data
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
  
        
        // Show note controller
        guard let vc = storyboard?.instantiateViewController(identifier: "note3")     as? NotaCaderno3 else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Resultados"
        vc.nota = modelo[indexPath.row].nota
        vc.data = modelo[indexPath.row].data
        vc.anotacao = modelo[indexPath.row].salvarAnotacao
        vc.indice = indexPath.row
        vc.delegate = self
        
        navigationController?.pushViewController(vc,animated: true)
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        modelo.remove(at: indexPath.row)
        gravarRegistros(modelo)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    // organizar
    func sortBasedOnSegmentPressed(){
        switch filtro.selectedSegmentIndex{
        case 0:
            ordemMaiorNota()
        case 1:
            ordemMenorNota()
        default: print("erro")
        }
    }
    
    
    func ordemMaiorNota(){
        modelo.sort { $0.nota > $1.nota }
        table.reloadData()
    }
    func ordemMenorNota() {
        modelo.sort { $0.nota < $1.nota }
        table.reloadData()
    }
    
    func atualizar(_ anotacao: String, _ indice: Int) {
        modelo[indice].salvarAnotacao = anotacao
        gravarRegistros(modelo)
        table.reloadData()
    }
    
}








