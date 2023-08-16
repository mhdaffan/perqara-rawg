//
//  GameDetail.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

struct GameDetailModel: Codable {
    let id: Int
    let name: String
    let descriptionRaw: String
    let released: String
    let backgroundImage: String
    let rating: Double
    let playtime: Int
    let publishers: [PublisherModel]
    
    enum CodingKeys: String, CodingKey {
        case id, name, released, rating, playtime, publishers
        case descriptionRaw = "description_raw"
        case backgroundImage = "background_image"
    }
}

struct PublisherModel: Codable {
    let id: Int
    let name: String
}
