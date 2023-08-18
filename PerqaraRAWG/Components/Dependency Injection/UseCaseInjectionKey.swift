//
//  UseCaseInjectionKey.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

struct GamesUseCaseInjectionKey: InjectionKey {
    static var currentValue: GamesUseCase = GamesUseCaseImpl()
}

struct CoreDataUseCaseInjectionKey: InjectionKey {
    static var currentValue: CoreDataUseCase = CoreDataUseCaseImpl()
}

extension InjectedValue {
    
    var gamesUseCase: GamesUseCase {
        get { Self[GamesUseCaseInjectionKey.self] }
        set { Self[GamesUseCaseInjectionKey.self] = newValue }
    }
    
    var coreDataUseCase: CoreDataUseCase {
        get { Self[CoreDataUseCaseInjectionKey.self] }
        set { Self[CoreDataUseCaseInjectionKey.self] = newValue }
    }
    
}
