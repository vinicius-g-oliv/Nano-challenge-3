//
//  Registro.swift
//  NanoChallenge3
//
//  Created by Vinicius Gomes on 09/05/22.
//

import Foundation

struct RegistroCaderno3 : Codable {
    var nota: String
    var data: String
    var salvarAnotacao: String
    
    public init(nota: String, data: String, salvarAnotacao: String){
        self.nota = nota
        self.data = data
        self.salvarAnotacao = salvarAnotacao
    
    }
}

func lerRegistros() -> [RegistroCaderno3]{
    if let data = UserDefaults.standard.data(forKey: "itens3") {
        let array = try! PropertyListDecoder().decode([RegistroCaderno3].self, from: data)
        return array
    }
    return []
    
}

func gravarRegistros(_ modelo: [RegistroCaderno3]){
    if let data = try? PropertyListEncoder().encode(modelo) {
        UserDefaults.standard.set(data, forKey: "itens3")
        
    }
}
