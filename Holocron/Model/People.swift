//
//  Character.swift
//  Holocron
//
//  Created by Coco on 19/01/2021.
//

import UIKit

class People: ApiData {
    var birthYear: String?
    var films: [String]?
    var species: [String]?
    var starships: [String]?
    var vehicles: [String]?
    var homeworld: String?
    
    enum CodingKeys: String, CodingKey {
        case birthYear = "birth_year"
        case films = "films"
        case species = "species"
        case vehicles = "vehicles"
        case homeworld = "homeworld"
    }
}
