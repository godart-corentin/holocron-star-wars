//
//  Starship.swift
//  Holocron
//
//  Created by Coco on 19/01/2021.
//

import UIKit

class Starship: Transport {
    var starshipClass: String?
    
    enum CodingKeys: String, CodingKey {
        case starshipClass = "starship_class"
    }
}
