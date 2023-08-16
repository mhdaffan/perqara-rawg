//
//  RepositoryInjectionKey.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

struct GamesRepositoryInjectionKey: InjectionKey {
    static var currentValue: GamesRepository = GamesRepositoryImpl()
}

extension InjectedValue {
    
    var gamesRepository: GamesRepository {
        get { Self[GamesRepositoryInjectionKey.self] }
        set { Self[GamesRepositoryInjectionKey.self] = newValue }
    }
    
}
