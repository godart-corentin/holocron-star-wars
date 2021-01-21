//
//  Character.swift
//  Holocron
//
//  Created by Coco on 19/01/2021.
//

import UIKit
import SerializedSwift

class People: ApiData {
    
    @Serialized("birth_year")
    var birthYear: String?
    @Serialized
    var films: [String]?
    @Serialized
    var species: [String]?
    @Serialized
    var starships: [String]?
    @Serialized
    var vehicles: [String]?
    @Serialized
    var homeworld: String?
    
}
