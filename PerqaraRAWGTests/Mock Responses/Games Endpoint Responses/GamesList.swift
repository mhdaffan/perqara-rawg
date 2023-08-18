//
//  GamesList.swift
//  PerqaraRAWGTests
//
//  Created by Muhammad Affan on 18/08/23.
//

import Foundation
@testable import PerqaraRAWG

extension GamesListModel {
    
    static func mock() -> Data {
        let jsonString = """
        {
            "count": 852584,
            "next": "https://api.rawg.io/api/games?key=d7f5cd955e9f46118a0754145354bc7a&page=2&page_size=20",
            "previous": null,
            "results": [
                {
                    "id": 3498,
                    "slug": "grand-theft-auto-v",
                    "name": "Grand Theft Auto V",
                    "released": "2013-09-17",
                    "tba": false,
                    "background_image": "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg",
                    "rating": 4.47,
                    "rating_top": 5,
                    "ratings_count": 6478,
                    "reviews_text_count": 55,
                    "added": 19890,
                    "added_by_status": {
                        "yet": 511,
                        "owned": 11464,
                        "beaten": 5573,
                        "toplay": 593,
                        "dropped": 1043,
                        "playing": 706
                    },
                    "metacritic": 92,
                    "playtime": 74,
                    "suggestions_count": 422,
                    "updated": "2023-08-17T16:12:53",
                    "user_game": null,
                    "reviews_count": 6573,
                    "saturated_color": "0f0f0f",
                    "dominant_color": "0f0f0f",
                    "esrb_rating": {
                        "id": 4,
                        "name": "Mature",
                        "slug": "mature"
                    }
                },
                {
                    "id": 3328,
                    "slug": "the-witcher-3-wild-hunt",
                    "name": "The Witcher 3: Wild Hunt",
                    "released": "2015-05-18",
                    "tba": false,
                    "background_image": "https://media.rawg.io/media/games/618/618c2031a07bbff6b4f611f10b6bcdbc.jpg",
                    "rating": 4.66,
                    "rating_top": 5,
                    "ratings_count": 6194,
                    "reviews_text_count": 68,
                    "added": 19151,
                    "added_by_status": {
                        "yet": 1079,
                        "owned": 11070,
                        "beaten": 4536,
                        "toplay": 746,
                        "dropped": 875,
                        "playing": 845
                    },
                    "metacritic": 92,
                    "playtime": 45,
                    "suggestions_count": 670,
                    "updated": "2023-08-17T15:27:24",
                    "user_game": null,
                    "reviews_count": 6293,
                    "saturated_color": "0f0f0f",
                    "dominant_color": "0f0f0f",
                    "clip": null,
                    "esrb_rating": {
                        "id": 4,
                        "name": "Mature",
                        "slug": "mature"
                    }
                }
            ],
            "seo_title": "All Games",
            "seo_description": "",
            "seo_keywords": "",
            "seo_h1": "All Games",
            "noindex": false,
            "nofollow": false,
            "description": "",
            "nofollow_collections": [
                "stores"
            ]
        }
        """.utf8
        return Data(jsonString)
    }
    
}
