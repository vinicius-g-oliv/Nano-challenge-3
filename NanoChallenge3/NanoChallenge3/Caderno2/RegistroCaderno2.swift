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
