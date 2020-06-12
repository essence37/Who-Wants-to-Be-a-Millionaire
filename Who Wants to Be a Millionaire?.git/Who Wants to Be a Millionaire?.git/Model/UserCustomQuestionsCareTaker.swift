//
//  UserCustomQuestionsCareTaker.swift
//  Who Wants to Be a Millionaire?.git
//
//  Created by Пазин Даниил on 12.06.2020.
//  Copyright © 2020 Пазин Даниил. All rights reserved.
//

import UIKit

final class UserCustomQuestionsCareTaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "question"
    
    func save(questions: [UserCustomQuestion]) {
        do {
            let data = try self.encoder.encode(questions)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveCustomQuestions() -> [UserCustomQuestion] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([UserCustomQuestion].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}

