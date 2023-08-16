//
//  GamesEndpoint.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

struct GamesEndpoint {
    
    static func gamesList(page: Int) -> DataEndpoint<GamesListModel> {
        return DataEndpoint(
            path: "api/games",
            method: .get,
            queryParameters: [
                "page_size" : 20,
                "page" : page
            ]
        )
    }
    
}
