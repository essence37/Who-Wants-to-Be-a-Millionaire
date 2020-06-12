//
//  AddQuestionViewController.swift
//  Who Wants to Be a Millionaire?.git
//
//  Created by Пазин Даниил on 12.06.2020.
//  Copyright © 2020 Пазин Даниил. All rights reserved.
//

import UIKit

class AddQuestionViewController: UIViewController {
    // MARK: - IBActions
    @IBAction func backToSettingsTapped(_ sender: Any) {
        performSegue(withIdentifier: "cancelToSettings", sender: self)
    }
    // Кнопка добавления вопроса.
    @IBAction func addQuestionButton(_ sender: Any) {
        checkFieldsAndCreateQuestion()
    }
    // MARK: - IBOutlets
    // Сложность вопроса.
    @IBOutlet weak var questionDifficulty: UISegmentedControl!
    // Поле ввода вопроса.
    @IBOutlet weak var questionField: UITextField!
    // Вариант ответа А.
    @IBOutlet weak var variantA: UITextField!
    // Вариант ответа B.
    @IBOutlet weak var variantB: UITextField!
    // Вариант ответа C.
    @IBOutlet weak var variantC: UITextField!
    // Вариант ответа D.
    @IBOutlet weak var variantD: UITextField!
    // Выбор правильного ответа.
    @IBOutlet weak var correctAnswerControl: UISegmentedControl!
    
    
    
   
    
    
    // Проверка заполненности полей для ввода и создание вопроса.
    func checkFieldsAndCreateQuestion() {
        guard let questionField = questionField.text, !questionField.isEmpty,
            let variantA = variantA.text , !variantA.isEmpty,
            let variantB = variantB.text, !variantB.isEmpty,
            let variantC = variantC.text, !variantC.isEmpty,
            let variantD = variantD.text, !variantD.isEmpty
            else {
                let alert = UIAlertController(title: "Вы заполнили все поля?", message: "Нужно заполнить все поля, чтобы добавить вопрос.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Окей", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                return }
        // Определение правильного ответа из введённых.
        var correctAnswer: [String : Bool] {
            switch self.correctAnswerControl.selectedSegmentIndex {
            case 0:
                return [variantA : true, variantB : false, variantC : false, variantD : false]
            case 1:
                return [variantA : false, variantB : true, variantC : false, variantD : false]
            case 2:
                return [variantA : false, variantB : false, variantC : true, variantD : false]
            case 3:
                return [variantA : false, variantB : false, variantC : false, variantD : true]
            default:
                return [variantA : true, variantB : false, variantC : false, variantD : false]
            }
        }
        // Уровень сложности вопроса.
        var selectedDifficulty: Int {
            switch self.questionDifficulty.selectedSegmentIndex {
            case 0:
                return 0
            case 1:
                return 1
            case 2:
                return 2
            default:
                return 0
            }
        }
        // Сохранение нового вопроса.
            let newQuestion = UserCustomQuestion(question: questionField, possibleAnswerA: variantA, possibleAnswerB: variantB, possibleAnswerC: variantC, possibleAnswerD: variantD, correctAnswerA: correctAnswer[variantA]!, correctAnswerB: correctAnswer[variantB]!, correctAnswerC: correctAnswer[variantC]!, correctAnswerD: correctAnswer[variantD]!, questionDifficulty: selectedDifficulty)
        Game.shared.addQuestion(newQuestion)
    }
    
    
}
