//
//  RegistroCaderno1.swift
//  NanoChallenge3
//
//  Created by Vinicius Gomes on 11/05/22.
//

import Foundation

struct RegistroCaderno1: Codable {
    var notaCaderno1 : String
    var dataCaderno1 : String
    var anotacaoCaderno1 : String
    public init (notaCaderno1: String , dataCaderno1 : String, anotacaoCaderno1: String) {
        self.notaCaderno1 = notaCaderno1
        self.dataCaderno1 = dataCaderno1
        self.anotacaoCaderno1 = anotacaoCaderno1
    }
    
}
func lerRegistros1() -> [RegistroCaderno1]{
    if let data = UserDefaults.standard.data(forKey: "itens1") {
        let array = try! PropertyListDecoder().decode([RegistroCaderno1].self, from: data)
        return array
    }
    return []
}
func gravarRegistro1(_ modelo: [RegistroCaderno1]){
    if let data = try? PropertyListEncoder().encode(modelo) {
        UserDefaults.standard.set(data, forKey: "itens1")
        
    }
}
