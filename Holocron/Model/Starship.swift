//
//  Starship.swift
//  Holocron
//
//  Created by Coco on 19/01/2021.
//

import UIKit
import SerializedSwift

class Starship: Transport {
    @Serialized("starship_class")
    var starshipClass: String?
}
