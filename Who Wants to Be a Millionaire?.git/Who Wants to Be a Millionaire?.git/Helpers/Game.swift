//
//  Game.swift
//  Who Wants to Be a Millionaire?.git
//
//  Created by Пазин Даниил on 07.06.2020.
//  Copyright © 2020 Пазин Даниил. All rights reserved.
//

import UIKit


final class Game {
    
    static let shared = Game()
    
    private(set) var results: [GameSession] {
        didSet {
            gameSessionsCaretaker.save(results: self.results)
        }
    }
    
    private let gameSessionsCaretaker = GameSessionsCaretaker()
    
    private init() {
        self.results = self.gameSessionsCaretaker.retrieveResults()
    }
    
    func addResult(_ result: GameSession) {
        self.results.append(result)
    }
    
    func clearResults() {
        self.results = []
    }
    // Удаление конкретного результата игры.
    func clearResult(at rowWithResult: Int) {
        self.results.remove(at: rowWithResult)
    }
}

