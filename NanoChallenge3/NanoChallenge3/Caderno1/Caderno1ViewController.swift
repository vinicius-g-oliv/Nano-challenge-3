//
//  Caderno1ViewController.swift
//  NanoChallenge3
//
//  Created by Vinicius Gomes on 18/04/22.
//

import UIKit

class Caderno1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
 
    @IBOutlet weak var filtro: UISegmentedControl!
    @IBOutlet var table: UITableView!
    @IBAction func Filter(_ sender: UISegmentedControl) {
        sortBasedOnSegmentPressed()
    }
    
    var modelo: [RegistroCaderno1] = []
    let dataPicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iniciar()
        let nib  = UINib(nibName: "CustomCellCaderno1", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "CustomCellCaderno1")
        table.delegate = self
        table.dataSource = self
        title = "Linguagens Ciências Humanas Espanhol"
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sortBasedOnSegmentPressed()
    }
    func ler_livros(){
        if let data = UserDefaults.standard.data(forKey: "itens1") {
            let array = try! PropertyListDecoder().decode([RegistroCaderno1].self, from: data)
            modelo = array
            
        }
        
    }
    
    func gravar_livros(){
        if let data = try? PropertyListEncoder().encode(self.modelo) {
            UserDefaults.standard.set(data, forKey: "itens1")
            
        }
    }
    
    func iniciar(){
        ler_livros()
        
    }
    
    @IBAction func didTapNewNote() {
        guard let vc = storyboard?.instantiateViewController(identifier: "new1") as? EntradaCaderno1 else {
            return
        }
        vc.title = "Novo Resultado"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { nota, data, anotacao in
            self.navigationController?.popViewController(animated: true)
            self.modelo.append(RegistroCaderno1(notaCaderno1: nota,dataCaderno1: data, anotacaoCaderno1: anotacao))
            if let data = try? PropertyListEncoder().encode(self.modelo) {
                UserDefaults.standard.set(data, forKey: "itens1")
            }
            UserDefaults.standard.synchronize()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // Table
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        return
    }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellCaderno1", for: indexPath) as! CustomCellCaderno1
        
        cell.nota.text = modelo[indexPath.row].notaCaderno1
        cell.data.text = modelo[indexPath.row].dataCaderno1
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let modelo = modelo[indexPath.row]
        
        
        // Show note controller
        guard let vc = storyboard?.instantiateViewController(identifier: "note1") as? NoteViewController1 else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Resultados"
        vc.nota = modelo.notaCaderno1
        vc.data = modelo.dataCaderno1
        vc.anotacao = modelo.anotacaoCaderno1
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
    //organizar
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
        modelo.sort { $0.notaCaderno1 > $1.notaCaderno1 }
        table.reloadData()
    }
    func ordemMenorNota() {
        modelo.sort { $0.notaCaderno1 < $1.notaCaderno1 }
        table.reloadData()
    }
    
    
    
    
}
