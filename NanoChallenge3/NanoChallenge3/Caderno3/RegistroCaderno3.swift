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
