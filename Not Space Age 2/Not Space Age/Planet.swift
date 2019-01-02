//
//  Planet.swift
//  Not Space Age
//
//  Created by Kyle Smith on 10/30/18.
//  Copyright © 2018 smithcoding. All rights reserved.
//

import Foundation

struct Planet {
    let name: String
    let orbitalRatio: Float
    let earthYearInSeconds: Float = 31557600.00
    let demonym: String
    
    func ageToPlanetYears(ageInEarthSeconds: Float) -> Float {
        let unroundedAge = ageInEarthSeconds / (earthYearInSeconds * self.orbitalRatio)
        return round(1000 * unroundedAge) / 1000
    }
}

struct PlanetCollection {
    let milkyWay = [
        Planet(name: "Mercury", orbitalRatio: 0.2408467, demonym: "Mercurian"),
        Planet(name: "Venus", orbitalRatio: 0.61519726, demonym: "Venetian"),
        Planet(name: "Earth", orbitalRatio: 1.0, demonym: "Earth"),
        Planet(name: "Mars", orbitalRatio: 1.8808158, demonym: "Martian"),
        Planet(name: "Jupiter", orbitalRatio: 11.862615 , demonym: "Jovian"),
        Planet(name: "Saturn", orbitalRatio: 29.447498, demonym: "Saturnian"),
        Planet(name: "Uranus", orbitalRatio: 84.016846, demonym: "Uranian"),
        Planet(name: "Neptune", orbitalRatio: 164.79132, demonym: "Neptunian")
    ]
}
