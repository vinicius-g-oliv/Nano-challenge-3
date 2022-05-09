//
//  Registro.swift
//  NanoChallenge3
//
//  Created by Vinicius Gomes on 09/05/22.
//

import Foundation

struct Registro : Codable {
    var nota: String
    var data: String
    
    public init(nota: String, data: String){
        self.nota = nota
        self.data = data
    
    }
}
