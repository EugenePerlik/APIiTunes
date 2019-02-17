//
//  PodkastInfo.swift
//  API iTunes
//
//  Created by  Apple24 on 17/02/2019.
//  Copyright © 2019  Apple24. All rights reserved.
//

import Foundation

struct Response: Codable {
    var resultCount : Int
    var results: [PodkastInfo]
}

struct PodkastInfo: Codable {
    
    var kind: String                  
    var primaryGenreName: String
    var trackId: Int
    var trackName: String
 //   var releaseDate: Date             // "releaseDate": "2019-02-10T18:40:00Z"
    var artworkUrl600: URL
    var genres: [String]?

//    enum CodingKeys: String, CodingKey {
//        case kind
//        case primaryGenreName
//        case trackId
//        case trackName
//        case releaseDate                          //   останется время разберусь с датой
//        case artworkUrl600 = "url600"
//        case genres                              "genres":["Технологии", "Подкасты"]  ???
//    }

    // вручную декодируем не обязательно
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)

        kind = try valueContainer.decode(String.self, forKey: .kind)
        primaryGenreName = try valueContainer.decode(String.self, forKey: CodingKeys.primaryGenreName)
        trackId =  try valueContainer.decode(Int.self, forKey: .trackId)
        trackName = try valueContainer.decode(String.self, forKey: .trackName)
   //     releaseDate = try valueContainer.decode(Date.self, forKey: .releaseDate)
        artworkUrl600 = try valueContainer.decode(URL.self, forKey: .artworkUrl600)
        genres = try? valueContainer.decode([String].self, forKey: .genres)

    }
}

