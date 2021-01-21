//
//  Vehicles.swift
//  Holocron
//
//  Created by Coco on 19/01/2021.
//

import UIKit
import SerializedSwift

class Vehicle: Transport {
    @Serialized("vehicle_class")
    var vehicleClass: String?
}

