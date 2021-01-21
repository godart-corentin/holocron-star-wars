//
//  Film.swift
//  Holocron
//
//  Created by Coco on 19/01/2021.
//

import UIKit

class Film: ApiData {
    var director: String?
    var producer: String?
    var releaseDate: String?
    var episodeId: Int?
    var characters: [String]?
    var planets: [String]?
    var species: [String]?
    var starships: [String]?
    var vehicles: [String]?
    var intro: String?
    
    enum CodingKeys: String, CodingKey {
        case director = "director"
        case producer = "producer"
        case releaseDate = "release_date"
        case episodeId = "episode_id"
        case characters = "characters"
        case planets = "planets"
        case species = "species"
        case starships = "starships"
        case vehicles = "vehicles"
        case intro = "opening_crawl"
    }
}
