//
//  Persoon.swift
//  Werkstuk1
//
//  Created by student on 06/04/2019.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

class Persoon
{
    var naam: String?
    var voornaam: String?
    var foto: String
    var adres: Adres
    var gpsCoordinaten: [Double]
    var telefoonnummer: String?
    
    init()
    {
        self.naam = ""
        self.voornaam = ""
        self.foto = ""
        self.adres = Adres(straat: "", huisnummer: 0, postcode: 0, gemeente: "")
        self.gpsCoordinaten = [0.1, 0.1]
        self.telefoonnummer = ""
    }

    init(naam: String, voornaam: String, foto: String, gpsCoordinaten: [Double], telefoonnummer: String, adres: Adres)
    {
        self.naam = naam
        self.voornaam = voornaam
        self.foto = foto
        self.gpsCoordinaten = gpsCoordinaten
        self.telefoonnummer = telefoonnummer
        self.adres = adres
    }
    
}

