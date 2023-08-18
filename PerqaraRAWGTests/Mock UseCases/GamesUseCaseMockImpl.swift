//
//  GamesUseCaseMockImpl.swift
//  PerqaraRAWGTests
//
//  Created by Muhammad Affan on 18/08/23.
//

import Foundation
@testable import PerqaraRAWG

class GamesUseCaseMockImpl: GamesUseCaseImpl {
    
    init(gamesRepository: GamesRepository) {
        super.init()
        self.gamesRepository = gamesRepository
    }
    
}
