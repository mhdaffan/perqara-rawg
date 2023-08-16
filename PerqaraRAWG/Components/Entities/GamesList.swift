//
//  GamesList.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

struct GamesListModel: Codable {
    let count: Int
    let results: [GameModel]
    
    enum CodingKeys: String, CodingKey {
        case count, results
    }
}

struct GameModel: Codable {
    let id: Int
    let slug: String
    let name: String
    let released: String
    let backgroundImage: String
    let rating: Double
    
    enum CodingKeys: String, CodingKey {
        case id, slug, name, released, rating
        case backgroundImage = "background_image"
    }
}
