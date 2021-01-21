//
//  Species.swift
//  Holocron
//
//  Created by Coco on 19/01/2021.
//

import UIKit

class Species: ApiData {
    var classification: String?
    var designation: String?
    var averageHeight: String?
    var averageLifespan: String?
    var skinColors: String?
    var eyeColors: String?
    var hairColors: String?
    var language: String?
    var homeworld: String?
    var people: [String]?
    var films: [String]?
    
    enum CodingKeys: String, CodingKey {
        case classification = "classification"
        case designation = "designation"
        case averageHeight = "average_height"
        case averageLifespan = "average_lifespan"
        case skinColors = "skin_colors"
        case eyeColors = "eye_colors"
        case hairColors = "hair_colors"
        case language = "language"
        case homeworld = "homeworld"
        case people = "people"
        case films = "films"
    }
}
