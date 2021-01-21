//
//  Transport.swift
//  Holocron
//
//  Created by Coco on 20/01/2021.
//

import UIKit

class Transport: ApiData {
    var model: String?
    var manufacturer: String?
    var cost: String?
    var length: String?
    var films: [String]?
    var pilots: [String]?
    
    enum CodingKeys: String, CodingKey {
        case model = "model"
        case manufacturer = "manufacturer"
        case cost = "cost_in_credits"
        case length = "length"
        case films = "films"
        case pilots = "pilots"
    }
}
