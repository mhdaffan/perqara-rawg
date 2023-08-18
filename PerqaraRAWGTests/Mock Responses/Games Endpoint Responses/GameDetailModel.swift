//
//  GameDetailModel.swift
//  PerqaraRAWGTests
//
//  Created by Muhammad Affan on 18/08/23.
//

import Foundation
@testable import PerqaraRAWG

extension GameDetailModel {
    
    static func mock() -> Data {
        let jsonString = """
        {
            "id": 4435,
            "slug": "motorstorm-rc",
            "name": "MotorStorm RC",
            "name_original": "MotorStorm RC",
            "metacritic": 78,
            "released": "2012-02-22",
            "tba": false,
            "updated": "2023-07-24T03:55:40",
            "background_image": "https://media.rawg.io/media/games/825/82575be8cc9ea947a10dbdfd45c3b4d8.jpg",
            "rating": 3.07,
            "playtime": 5,
            "screenshots_count": 12,
            "movies_count": 0,
            "creators_count": 0,
            "achievements_count": 60,
            "parent_achievements_count": 30,
            "reddit_url": "",
            "reddit_name": "",
            "reddit_description": "",
            "reddit_logo": "",
            "reddit_count": 0,
            "twitch_count": 6,
            "youtube_count": 50799,
            "reviews_text_count": 1,
            "ratings_count": 73,
            "suggestions_count": 633,
            "parents_count": 0,
            "additions_count": 0,
            "game_series_count": 4,
            "user_game": null,
            "reviews_count": 74,
            "saturated_color": "0f0f0f",
            "dominant_color": "0f0f0f",
            "publishers": [
                {
                    "id": 10212,
                    "name": "Sony Computer Entertainment",
                    "slug": "sony-computer-entertainment",
                    "games_count": 464,
                    "image_background": "https://media.rawg.io/media/games/4b6/4b67558bf04c7211aabeff179271bdd8.jpg"
                }
            ],
            "description_raw": "Let go of the steering wheel"
        }
        """.utf8
        return Data(jsonString)
    }
    
    static func mockModel() -> GameDetailModel {
        return try! JSONDecoder().decode(GameDetailModel.self, from: GameDetailModel.mock())
    }
    
}
