

import UIKit

class Caderno2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var notas: UIButton!
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
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
        let nib  = UINib(nibName: "CustomCellCaderno2", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "CustomCellCaderno2")
        super.viewDidLoad()
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "Linguagens Ciências Humanas Inglês"
        
        
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
        ordemNota()
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
        
        cell.nota.text = modelo[indexPath.row].title
        cell.data.text = modelo[indexPath.row].btndata
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = modelo[indexPath.row]
        
        // Show note controller
        
        
        guard let vc = storyboard?.instantiateViewController(identifier: "note") as? NotaCaderno2 else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Resultados"
        vc.nota = model.title
        vc.anotacao = model.anotacao
        vc.data = model.btndata
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        modelo.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    
    //organizar
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






