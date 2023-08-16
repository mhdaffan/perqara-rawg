//
//  UseCaseInjectionKey.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

struct GamesUseCaseInjectionKey: InjectionKey {
    static var currentValue: GamesUseCase = GamesUseCaseImpl()
}

extension InjectedValue {
    
    var gamesUseCase: GamesUseCase {
        get { Self[GamesUseCaseInjectionKey.self] }
        set { Self[GamesUseCaseInjectionKey.self] = newValue }
    }
    
}
