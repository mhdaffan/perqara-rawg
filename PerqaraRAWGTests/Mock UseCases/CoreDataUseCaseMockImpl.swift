//
//  CoreDataUseCaseMockImpl.swift
//  PerqaraRAWGTests
//
//  Created by Muhammad Affan on 18/08/23.
//

import Foundation
@testable import PerqaraRAWG

class CoreDataUseCaseMockImpl: CoreDataUseCaseImpl {
    
    init(coreDataRepository: CoreDataRepositoryMockImpl) {
        super.init()
        self.coreDataRepository =  coreDataRepository
    }
    
}
