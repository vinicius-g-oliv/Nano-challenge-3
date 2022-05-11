//
//  Caderno3ViewController.swift
//  NanoChallenge3
//
//  Created by Vinicius Gomes on 19/04/22.
//

import UIKit

class Caderno2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var table: UITableView!
    @IBOutlet weak var filtro: UISegmentedControl!
    @IBAction func Filter(_ sender: UISegmentedControl) {
        sortBasedOnSegmentPressed()
    }
    
    var modelo: [RegistroCaderno2] = []
    let dataPicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iniciar()
        let nib  = UINib(nibName: "CustomCellCaderno2", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "CustomCellCaderno2")
        table.delegate = self
        table.dataSource = self
        title = "Linguagens Ciências Humanas Inglês"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sortBasedOnSegmentPressed()
    }
    
    func ler_livros(){
        if let data = UserDefaults.standard.data(forKey: "itens2") {
            let array = try! PropertyListDecoder().decode([RegistroCaderno2].self, from: data)
            modelo = array
            
        }
        
    }

    
    
    func gravar_livros(){
        if let data = try? PropertyListEncoder().encode(self.modelo) {
            UserDefaults.standard.set(data, forKey: "itens2")
            
        }
    }
    
    func iniciar(){
        ler_livros()
        
    }
    
    @IBAction func didTapNewNote() {
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? EntradaCaderno2 else {
            return
        }
        vc.title = "Novo Resultado"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { nota ,data , anotacao in
            self.navigationController?.popViewController(animated: true)
            self.modelo.append(RegistroCaderno2(notaCaderno2: nota, dataCaderno2: data, anotacaoCaderno2: anotacao))
            if let data = try? PropertyListEncoder().encode(self.modelo) {
                UserDefaults.standard.set(data, forKey: "itens2")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellCaderno2", for: indexPath) as! CustomCellCaderno2
        
        cell.nota.text = modelo[indexPath.row].notaCaderno2
        cell.data.text = modelo[indexPath.row].dataCaderno2
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let modelo = modelo[indexPath.row]
        
        // Show note controller
        guard let vc = storyboard?.instantiateViewController(identifier: "note") as? NotaCaderno2 else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Resultados"
        vc.nota = modelo.notaCaderno2
        vc.data = modelo.dataCaderno2
        vc.anotacao = modelo.anotacaoCaderno2
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        modelo.remove(at: indexPath.row)
        gravar_livros()
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
        modelo.sort { $0.notaCaderno2 > $1.notaCaderno2 }
        table.reloadData()
    }
    func ordemMenorNota() {
        modelo.sort { $0.notaCaderno2 < $1.notaCaderno2 }
        table.reloadData()
    }
    
    
}







