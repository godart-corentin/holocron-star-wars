//
//  Species.swift
//  Holocron
//
//  Created by Coco on 19/01/2021.
//

import UIKit
import SerializedSwift

class Species: ApiData {
    @Serialized
    var classification: String?
    @Serialized
    var designation: String?
    @Serialized("average_height")
    var averageHeight: String?
    @Serialized("average_lifespan")
    var averageLifespan: String?
    @Serialized("skin_colors")
    var skinColors: String?
    @Serialized("eye_colors")
    var eyeColors: String?
    @Serialized("hair_colors")
    var hairColors: String?
    @Serialized
    var language: String?
    @Serialized
    var homeworld: String?
    @Serialized
    var people: [String]?
    @Serialized
    var films: [String]?
}
