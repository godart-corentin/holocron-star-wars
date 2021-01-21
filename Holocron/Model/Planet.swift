//
//  Planet.swift
//  Holocron
//
//  Created by Coco on 19/01/2021.
//

import UIKit
import SerializedSwift

class Planet: ApiData {
    @Serialized
    var diameter: String?
    @Serialized("rotation_period")
    var rotationPeriod: String?
    @Serialized("orbital_period")
    var orbitalPeriod: String?
    @Serialized
    var gravity: String?
    @Serialized
    var population: String?
    @Serialized
    var climate: String?
    @Serialized
    var terrain: String?
    @Serialized("surface_water")
    var surfaceWater: String?
    @Serialized
    var residents: [String]?
    @Serialized
    var films: [String]?
}
