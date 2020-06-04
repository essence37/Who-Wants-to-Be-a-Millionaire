//
//  GameViewController.swift
//  Who Wants to Be a Millionaire?.git
//
//  Created by Пазин Даниил on 03.06.2020.
//  Copyright © 2020 Пазин Даниил. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    // Вопрос.
    @IBOutlet weak var questionLabel: UILabel!
    // Первый вариант ответа.
    @IBOutlet weak var firstAnswerButton: UIButton!
    // Второй вариант ответа.
    @IBOutlet weak var secondAnswerButton: UIButton!
    // Третий вариант ответа.
    @IBOutlet weak var thirdAnswerButton: UIButton!
    // Четвёртый вариант ответа.
    @IBOutlet weak var fourthAnswerButton: UIButton!
    
    // MARK: - Переменные и константы.
    var answers: [String : Bool] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        generateAnswers(question: generateQuestion())
    }
    // MARK: - Функции
    // Генерация вопроса.
    func generateQuestion() -> String {
        // Генерация рандомного ключа (текста вопроса).
        let randomKey = Dictionary.Keys.randomElement(Questions().questions.keys)
        // Текст вопроса.
        questionLabel.text = randomKey()
        return questionLabel.text!
    }
    // Генерация ответа.
    func generateAnswers(question: String) {
        // Вызов переданной функции
        let question = question
        // Словарь с ответами.
        self.answers = Questions().questions[question]!
        // Массив с кнопками.
        let buttons = [firstAnswerButton, secondAnswerButton, thirdAnswerButton, fourthAnswerButton]
        
        for button in buttons {
            guard let key =  self.answers.keys.randomElement() else { return }
            self.answers.removeValue(forKey: key)
            button?.setTitle(key, for: .normal)
        }
    }
    
    // Логика обработки ответа пользователя.
    func userChoseAnAnswer(button: UIButton) {
        if self.answers[button.title(for: .normal)!]! {
            UIView.animate(withDuration: 0.3, animations: {
                button.backgroundColor = UIColor.orange
            }) { _ in
                UIView.animate(withDuration: 0.2, delay: 1.0, animations: {
                    button.backgroundColor = UIColor.green
                }, completion: nil)
            }
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                button.backgroundColor = UIColor.orange
            }) { _ in
                UIView.animate(withDuration: 0.2, delay: 1.0, animations: {
                    button.backgroundColor = UIColor.red
                }, completion: nil)
            }
        }
    }
    
    
    // MARK: - Обработка нажатий.
    @IBAction func firstAnswerButton(_ sender: Any) {
        userChoseAnAnswer(button: firstAnswerButton)
    }
    @IBAction func secondAnswerButton(_ sender: Any) {
        userChoseAnAnswer(button: secondAnswerButton)
    }
    @IBAction func thirdAnswerButton(_ sender: Any) {
        userChoseAnAnswer(button: thirdAnswerButton)
    }
    @IBAction func fourthAnswerButton(_ sender: Any) {
        userChoseAnAnswer(button: fourthAnswerButton)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
