//
//  DataResource.swift
//  Holocron
//
//  Created by Coco on 20/01/2021.
//

import UIKit

class DataResource: NSObject, Codable {
    var name: String?
    var type: String?
    var url: String?
    
    init(withName name: String?, withType type: String?, withUrl: String?) {
        if let _name = name {
            self.name = _name
        }
        if let _type = type {
            self.type = _type
        }
        if let _url = url {
            self.url = _url
        }
    }
}
