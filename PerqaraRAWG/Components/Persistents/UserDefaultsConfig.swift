//
//  UserDefaultsConfig.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 18/08/23.
//

import Foundation

// TODO: Replace this to Core Data for saving object in the future
@propertyWrapper
struct UserDefaultObject<T: Codable> {
    let key: UserDefaultsKey
    let defaultValue: T
    
    init(_ key: UserDefaultsKey, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.getObject(forKey: key.rawValue, castTo: T.self) ?? defaultValue
        }
        set {
            UserDefaults.standard.setObject(newValue, forKey: key.rawValue)
        }
    }
}

protocol ObjectSavable {
    func setObject<Object: Codable>(_ object: Object, forKey: String)
    func getObject<Object: Codable>(forKey: String, castTo type: Object.Type) throws -> Object?
}

extension UserDefaults: ObjectSavable {
    
    func setObject<Object: Codable>(_ object: Object, forKey: String) {
        do {
            let data = try JSONEncoder().encode(object)
            set(data, forKey: forKey)
        } catch {
            print(error)
        }
    }
    
    func getObject<Object: Codable>(forKey: String, castTo type: Object.Type) -> Object? {
        guard let data = data(forKey: forKey) else {
            return nil
        }
        do {
            return try? JSONDecoder().decode(type, from: data)
        }
    }
    
}

enum UserDefaultsKey: String {
    case favoriteGames
}

struct UserDefaultsConfig {
    
    @UserDefaultObject(.favoriteGames, defaultValue: [:])
    static var favoriteGames: [Int: GameDetailModel]
    
}
