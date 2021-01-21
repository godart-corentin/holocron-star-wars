//
//  Transport.swift
//  Holocron
//
//  Created by Coco on 20/01/2021.
//

import UIKit
import SerializedSwift

class Transport: ApiData {
    @Serialized
    var model: String?
    @Serialized
    var manufacturer: String?
    @Serialized("cost_in_credits")
    var cost: String?
    @Serialized
    var length: String?
    @Serialized
    var films: [String]?
    @Serialized
    var pilots: [String]?
}
