//
//  PeopleResponse.swift
//  Holocron
//
//  Created by Coco on 20/01/2021.
//

import UIKit

class ApiResponse: NSObject, Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [ApiData]?
}
