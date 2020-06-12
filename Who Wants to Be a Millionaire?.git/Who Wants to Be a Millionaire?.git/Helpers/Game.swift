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
    private(set) var customQuestions: [UserCustomQuestion] {
        didSet {
            userCustomQuestionsCareTaker.save(questions: self.customQuestions)
        }
    }
    
    private let gameSessionsCaretaker = GameSessionsCaretaker()
    private let userCustomQuestionsCareTaker = UserCustomQuestionsCareTaker()
    // Уровень сложности игры.
    var difficultyLevel: DifficultyLevels = .graduation
    
    private init() {
        self.results = self.gameSessionsCaretaker.retrieveResults()
        self.customQuestions = self.userCustomQuestionsCareTaker.retrieveCustomQuestions()
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
    
    func addQuestion(_ question: UserCustomQuestion) {
        self.customQuestions.append(question)
    }
}

