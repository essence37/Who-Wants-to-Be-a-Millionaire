//
//  GameViewController.swift
//  Who Wants to Be a Millionaire?.git
//
//  Created by Пазин Даниил on 03.06.2020.
//  Copyright © 2020 Пазин Даниил. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    // Процент прохождения игры.
    @IBOutlet weak var ratioOfRightAnswersLabel: UILabel!
    // Денежное «дерево».
    @IBOutlet weak var fifteenthGainLabel: UILabel!
    @IBOutlet weak var fourteenthGainLabel: UILabel!
    @IBOutlet weak var thirteenthGainLabel: UILabel!
    @IBOutlet weak var twelfthGainLabel: UILabel!
    @IBOutlet weak var eleventhGainLabel: UILabel!
    @IBOutlet weak var tenthGainLabel: UILabel!
    @IBOutlet weak var ninthGainLabel: UILabel!
    @IBOutlet weak var eighthGainLabel: UILabel!
    @IBOutlet weak var seventhGainLabel: UILabel!
    @IBOutlet weak var sixthGainLabel: UILabel!
    @IBOutlet weak var fifthGainLabel: UILabel!
    @IBOutlet weak var fourthGainLabel: UILabel!
    @IBOutlet weak var thirdGainLabel: UILabel!
    @IBOutlet weak var secondGainLabel: UILabel!
    @IBOutlet weak var firstGainLabel: UILabel!
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
    // Словарь с вопросами и ответами.
    var allQuestionsAndAnswers = (Question().easyQuestions, Question().normalQuestions, Question().hardQuestions)
    // Вопросы и ответы для текущей игры.
    var currentGameQuestions: [String : [String : Bool]] = [:]
    // Значение ответа привязывается к кнопке и передаётся в этот словарь.
    var answers: [UIButton? : Bool] = [:]
    // Счётчик вопросов.
    var questionCounter = 1
    // Уровень сложности.
    var difficulty: DifficultyLevels = .graduation
    // Стратегия формирования вопросов, исходя из уровня сложности.
    private var createQuestionsStrategy: CreateQuestionsStrategy {
        switch self.difficulty {
        case .easy:
            return EasyCreateQuestionsStrategy()
        case .normal:
            return NormalCreateQuestionsStrategy()
        case .hard:
            return HardCreateQuestionsStrategy()
        case .graduation:
            return GraduationCreateQuestionsStrategy()
        }
    }
    // Процент прохождения игры.
    var ratioOfRightAnswers = Observable<Double>(0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createQuastions()
        setPayoutStructureLabels()
        generateButtonValues(generateQuestionAndAnswers())
        addCustomQuestion()
        
        ratioOfRightAnswers.addObserver(self, options: [.new, .initial], closure: { [weak self] (ratioOfRightAnswers, _) in
            self?.ratioOfRightAnswersLabel.text = "Процент прохождения игры: \(ratioOfRightAnswers)%"
        })

        
    }
    // MARK: - Функции
    // Генерация вопросов и ответов для текущей игры.
    func createQuastions() {
        let questions = self.createQuestionsStrategy.createQuestions(from: allQuestionsAndAnswers)
        self.currentGameQuestions = questions
    }
    // Генерация вопроса. Отображение вопроса. Функция возвращает словарь с ответами от сгенерированного рандомно вопроса.
    func generateQuestionAndAnswers() -> [String : Bool] {
        // Генерация рандомного ключа (текста вопроса).
        let key = currentGameQuestions.first?.key
        // Текст вопроса.
        questionLabel.text = key
        let answers = currentGameQuestions[questionLabel.text!]!
        currentGameQuestions.removeValue(forKey: questionLabel.text!)
        return answers
    }
    // Отображение ответов, передача значений ответов в словарь. Текст и значение ответа привязываются к соответствующей кнопке.
    func generateButtonValues(_ answers: [String : Bool]) {
        // Новая переменная для изменения входного значения.
        var mutableAnswers = answers
        // Установка тайтлов кнопок в соответствии с ответами, передача значений в словарь с ответами для дальнейшей проверки.
        for button in [firstAnswerButton, secondAnswerButton, thirdAnswerButton, fourthAnswerButton] {
            // Выбор ключа из словаря рандомным образом, чтобы варианты ответов отобразжались каждый раз в разных кнопках. Проверка, что ключ существует.
            guard let key = mutableAnswers.keys.randomElement() else { return }
            // У становка тайтла кнопки в соответствии с названием ключа.
            button?.setTitle(key, for: .normal)
            // Передача кнопки и значения ответа в словарь.
            self.answers.updateValue(mutableAnswers[key]!, forKey: button)
            // Удаление пары "ключ : значение" из словаря для избежания повторного использования.
            mutableAnswers.removeValue(forKey: key)
        }
    }
    
    // Логика обработки ответа пользователя.
    func userChoseAnAnswer(button: UIButton, _ num: inout Int) {
        // Денежное «дерево».
        let payoutStructure: [Int : UILabel] = [1 : firstGainLabel,
                                                2 : secondGainLabel,
                                                3 : thirdGainLabel,
                                                4 : fourthGainLabel,
                                                5 : fifthGainLabel,
                                                6 : sixthGainLabel,
                                                7 : seventhGainLabel,
                                                8 : eighthGainLabel,
                                                9 : ninthGainLabel,
                                                10 : tenthGainLabel,
                                                11 : eleventhGainLabel,
                                                12 : twelfthGainLabel,
                                                13 : thirteenthGainLabel,
                                                14 : fourteenthGainLabel,
                                                15 : fifteenthGainLabel]
        // Изменяемая копия сквозного параметра для возможности его использования в замыкании.
        let mutableNum = num
        // Увеличение значения входного параметра.
        num += 1
        // Проверка истинности значения по ключу-кнопке.
        if self.answers[button]! {
            // Запуск анимации. Сначала кнопка загорается ораньжевым, потом зелёным.
            UIView.animate(withDuration: 0.1, animations: {
                button.backgroundColor = UIColor.orange
            }) { _ in
                UIView.animate(withDuration: 0.1, delay: 1.0, animations: {
                    button.backgroundColor = UIColor.green
                    payoutStructure[mutableNum]?.backgroundColor = .orange
                    // Передача в GameSession информации о текущей игре для обновления процента прохождения.
                    let score = self.questionCounter - 1
                    self.ratioOfRightAnswers.value = Double(score*100/15)
//                    GameSession.init(date: Date(), score: score, ratioOfRightAnswers: self.ratioOfRightAnswers.value)
                    if mutableNum > 1 {
                        payoutStructure[mutableNum-1]?.backgroundColor = .clear
                    }
                }, completion: { _ in
                    sleep(1)
                    button.backgroundColor = .clear
                    self.generateButtonValues(self.generateQuestionAndAnswers())
                })
            }
        } else {
            // То же самое, только в конце красным, так как ответ неверный.
            UIView.animate(withDuration: 0.3, animations: {
                button.backgroundColor = UIColor.orange
            }) { _ in
                UIView.animate(withDuration: 0.2, delay: 1.0, animations: {
                    button.backgroundColor = UIColor.red
                    sleep(1)
                    // Отображение и подсвечивание правильного варианта ответа.
                    self.answers.first(where: { $1 == true })?.key?.backgroundColor = UIColor.green
                }, completion: { _ in
                    sleep(2)
                    // Передача в GameSession информации о результате текущей игры.
                    let score = self.questionCounter - 1
                    self.ratioOfRightAnswers = Observable<Double>(Double(score*100/15))
                    let result = GameSession(date: Date(), score: score, ratioOfRightAnswers: self.ratioOfRightAnswers.value)
                    Game.shared.addResult(result)
                    // Возврат в главное меню.
                    self.performSegue(withIdentifier: "cancelToMainMenu", sender: self)
                })
            }
        }
    }

    func setPayoutStructureLabels() {
        firstGainLabel.text = "1. $100"
        secondGainLabel.text = "2. $200"
        thirdGainLabel.text = "3. $300"
        fourthGainLabel.text = "4. $500"
        fifthGainLabel.text = "5. $1.000"
        sixthGainLabel.text = "6. $2.000"
        seventhGainLabel.text = "7. $4.000"
        eighthGainLabel.text = "8. $8.000"
        ninthGainLabel.text = "9. $16.000"
        tenthGainLabel.text = "10. $32.000"
        eleventhGainLabel.text = "11. $64.000"
        twelfthGainLabel.text = "12. $125.000"
        thirteenthGainLabel.text = "13. $250.000"
        fourteenthGainLabel.text = "14. $500.000"
        fifteenthGainLabel.text = "15. $1.000.000"
    }

    // Добавление нового вопроса.
    func addCustomQuestion() {
        let customQuestions = Game.shared.customQuestions
        guard !customQuestions.isEmpty else { return }
        // Словарь с вопросами пользователя.
        var currentQuestions: [String : ([String : Bool], DifficultyLevels)] = [:]
        for i in 0...customQuestions.count - 1 {
            var findingOutСomplexity: DifficultyLevels {
                switch customQuestions[i].questionDifficulty {
                case 0:
                    return .easy
                case 1:
                    return .normal
                case 2:
                    return .hard
                default:
                    return .easy
                }
            }
            currentQuestions.updateValue(([customQuestions[i].possibleAnswerA : customQuestions[i].correctAnswerA,
                                           customQuestions[i].possibleAnswerB : customQuestions[i].correctAnswerB,
                                           customQuestions[i].possibleAnswerC : customQuestions[i].correctAnswerC,
                                           customQuestions[i].possibleAnswerD : customQuestions[i].correctAnswerD], findingOutСomplexity), forKey: customQuestions[i].question)
        }
        print(currentQuestions)
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
// MARK: - IBActions
extension GameViewController {
    // Обработка нажатий.
    @IBAction func firstAnswerButton(_ sender: Any) {
        userChoseAnAnswer(button: firstAnswerButton, &questionCounter)
    }
    @IBAction func secondAnswerButton(_ sender: Any) {
        userChoseAnAnswer(button: secondAnswerButton, &questionCounter)
    }
    @IBAction func thirdAnswerButton(_ sender: Any) {
        userChoseAnAnswer(button: thirdAnswerButton, &questionCounter)
    }
    @IBAction func fourthAnswerButton(_ sender: Any) {
        userChoseAnAnswer(button: fourthAnswerButton, &questionCounter)
    }
    @IBAction func backToMainMenuTapped(_ sender: Any) {
        performSegue(withIdentifier: "cancelToMainMenu", sender: self)
    }
}
    

