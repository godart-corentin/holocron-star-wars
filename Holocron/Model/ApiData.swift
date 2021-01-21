//
//  ApiData.swift
//  Holocron
//
//  Created by Coco on 20/01/2021.
//

import UIKit
import SerializedSwift

class ApiData: Serializable {
    @Serialized
    var url: String?
    @Serialized
    var name: String?
    @Serialized
    var title: String?
    @Serialized
    var type: String?
    
    required init() {}
}
