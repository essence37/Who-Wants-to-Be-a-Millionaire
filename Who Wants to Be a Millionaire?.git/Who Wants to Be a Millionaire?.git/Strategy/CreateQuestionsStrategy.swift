//
//  CreateQuestionsSetStrategy.swift
//  Who Wants to Be a Millionaire?.git
//
//  Created by Пазин Даниил on 10.06.2020.
//  Copyright © 2020 Пазин Даниил. All rights reserved.
//

import UIKit

// Стратегия создания массива с вопросами.
protocol CreateQuestionsStrategy {
    func createQuestions(from tuple: ([String : [String : Bool]], [String : [String : Bool]], [String : [String : Bool]])) -> [String : [String : Bool]]
}
// Создание классической последовательности вопросов.
final class GraduationCreateQuestionsStrategy: CreateQuestionsStrategy {
    func createQuestions(from tuple: ([String : [String : Bool]], [String : [String : Bool]], [String : [String : Bool]])) -> [String : [String : Bool]] {
        var mutableTuple = tuple
        var questions: [String : [String : Bool]] = [:]
        for _ in 1...5 {
            let easyQuestion = mutableTuple.0.randomElement()
            questions.updateValue(easyQuestion!.value, forKey: easyQuestion!.key)
            mutableTuple.0.removeValue(forKey: easyQuestion!.key)
        }
        for _ in 1...5 {
            let normalQuestion = mutableTuple.1.randomElement()
            questions.updateValue(normalQuestion!.value, forKey: normalQuestion!.key)
            mutableTuple.1.removeValue(forKey: normalQuestion!.key)
        }
        for _ in 1...5 {
            let hardQuestion = mutableTuple.2.randomElement()
            questions.updateValue(hardQuestion!.value, forKey: hardQuestion!.key)
            mutableTuple.2.removeValue(forKey: hardQuestion!.key)
        }
        return questions
    }
}
// Создание последовательности из лёгких вопросов.
final class EasyCreateQuestionsStrategy: CreateQuestionsStrategy {
    func createQuestions(from tuple: ([String : [String : Bool]], [String : [String : Bool]], [String : [String : Bool]])) -> [String : [String : Bool]] {
        var mutableTuple = tuple
        var questions: [String : [String : Bool]] = [:]
        for _ in 1...15 {
            let easyQuestion = mutableTuple.0.randomElement()
            questions.updateValue(easyQuestion!.value, forKey: easyQuestion!.key)
            mutableTuple.0.removeValue(forKey: easyQuestion!.key)
        }
        return questions
    }
}
// Создание последовательности из вопросов средней сложности.
final class NormalCreateQuestionsStrategy: CreateQuestionsStrategy {
    func createQuestions(from tuple: ([String : [String : Bool]], [String : [String : Bool]], [String : [String : Bool]])) -> [String : [String : Bool]] {
        var mutableTuple = tuple
        var questions: [String : [String : Bool]] = [:]
        for _ in 1...15 {
            let easyQuestion = mutableTuple.1.randomElement()
            questions.updateValue(easyQuestion!.value, forKey: easyQuestion!.key)
            mutableTuple.1.removeValue(forKey: easyQuestion!.key)
        }
        return questions
    }
}
// Создание последовательности из трудных вопросов.
final class HardCreateQuestionsStrategy: CreateQuestionsStrategy {
    func createQuestions(from tuple: ([String : [String : Bool]], [String : [String : Bool]], [String : [String : Bool]])) -> [String : [String : Bool]] {
        var mutableTuple = tuple
        var questions: [String : [String : Bool]] = [:]
        for _ in 1...15 {
            let easyQuestion = mutableTuple.2.randomElement()
            questions.updateValue(easyQuestion!.value, forKey: easyQuestion!.key)
            mutableTuple.2.removeValue(forKey: easyQuestion!.key)
        }
        return questions
    }
}
