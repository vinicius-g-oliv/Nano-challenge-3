//
//  Registro.swift
//  NanoChallenge3
//
//  Created by Vinicius Gomes on 09/05/22.
//

import Foundation

struct Registro : Codable {
    var salvarAcertos: String
    var salvarData: String
    var salvarNota: String
    
    public init(salvarAcertos: String, salvarData: String, salvarNota: String){
        self.salvarAcertos = salvarAcertos
        self.salvarData = salvarData
        self.salvarNota = salvarNota
    
    }
}
