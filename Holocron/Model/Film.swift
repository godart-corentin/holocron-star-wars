//
//  Film.swift
//  Holocron
//
//  Created by Coco on 19/01/2021.
//

import UIKit
import SerializedSwift

class Film: ApiData {
    @Serialized
    var director: String?
    @Serialized
    var producer: String?
    @Serialized("release_date")
    var releaseDate: String?
    @Serialized("episode_id")
    var episodeId: Int?
    @Serialized
    var characters: [String]?
    @Serialized
    var planets: [String]?
    @Serialized
    var species: [String]?
    @Serialized
    var starships: [String]?
    @Serialized
    var vehicles: [String]?
    @Serialized("opening_crawl")
    var intro: String?
}
