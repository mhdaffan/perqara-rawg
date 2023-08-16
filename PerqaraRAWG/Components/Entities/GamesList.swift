//
//  GamesList.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

struct GamesListModel: Codable {
    var page: Int = 1
    var games: [GameModel]
    var next: String?
    
    enum CodingKeys: String, CodingKey {
        case next
        case games = "results"
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
