//
//  Vehicles.swift
//  Holocron
//
//  Created by Coco on 19/01/2021.
//

import UIKit

class Vehicle: Transport {
    var vehicleClass: String?
    
    enum CodingKeys: String, CodingKey {
        case vehicleClass = "vehicle_class"
    }
}

