//
//  GameSessionsCaretaker.swift
//  Who Wants to Be a Millionaire?.git
//
//  Created by Пазин Даниил on 08.06.2020.
//  Copyright © 2020 Пазин Даниил. All rights reserved.
//

import UIKit

final class GameSessionsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "gameSessions"
    
    func save(results: [GameSession]) {
        do {
            let data = try self.encoder.encode(results)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveResults() -> [GameSession] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([GameSession].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}

