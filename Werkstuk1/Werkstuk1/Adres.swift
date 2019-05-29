//
//  Adres.swift
//  Werkstuk1
//
//  Created by student on 06/04/2019.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

class Adres
{
    var straat: String
    var huisnummer: Int
    var postcode: Int
    var gemeente: String
    
    init()
    {
        self.straat = ""
        self.huisnummer = 0
        self.postcode = 0
        self.gemeente = ""
    }
    
    init(straat: String, huisnummer: Int, postcode: Int, gemeente: String) {
        self.straat = straat
        self.huisnummer = huisnummer
        self.postcode = postcode
        self.gemeente = gemeente
    }
    
    func ToString() -> String
    {
        let str = "\(self.straat) \(self.huisnummer), \(self.postcode) \(self.gemeente)"
        return str
    }
    
}
