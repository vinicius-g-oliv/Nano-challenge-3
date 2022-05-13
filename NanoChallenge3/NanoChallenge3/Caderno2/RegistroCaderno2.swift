//
//  Registro.swift
//  NanoChallenge3
//
//  Created by Vinicius Gomes on 10/05/22.
//

import Foundation
struct RegistroCaderno2 : Codable {
    var notaCaderno2: String
    var dataCaderno2: String
    var anotacaoCaderno2: String
    
    public init(notaCaderno2: String, dataCaderno2: String, anotacaoCaderno2: String){
        self.notaCaderno2 = notaCaderno2
        self.dataCaderno2 = dataCaderno2
        self.anotacaoCaderno2 = anotacaoCaderno2
        
    }
}
    
func lerRegistro2() -> [RegistroCaderno2] {
    if let data = UserDefaults.standard.data(forKey: "itens2") {
        let array = try! PropertyListDecoder().decode([RegistroCaderno2].self, from: data)
        return array
}
    return []
}
func gravarRegistro2(_ modelo: [RegistroCaderno2]) {
    if let data = try? PropertyListEncoder().encode(modelo) {
        UserDefaults.standard.set(data, forKey: "itens2")
    }
}
