//
//  Planet.swift
//  Holocron
//
//  Created by Coco on 19/01/2021.
//

import UIKit

class Planet: ApiData {
    var diameter: String?
    var rotationPeriod: String?
    var orbitalPeriod: String?
    var gravity: String?
    var population: String?
    var climate: String?
    var terrain: String?
    var surfaceWater: String?
    var residents: [String]?
    var films: [String]?
    
    enum CodingKeys: String, CodingKey {
        case diameter = "diameter"
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case gravity = "gravity"
        case population = "population"
        case climate = "climate"
        case terrain = "terrain"
        case surfaceWater = "surface_water"
        case residents = "residents"
        case films = "films"
    }
}
