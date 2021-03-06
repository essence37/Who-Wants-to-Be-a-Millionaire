//
//  Question.swift
//  Who Wants to Be a Millionaire?.git
//
//  Created by Пазин Даниил on 03.06.2020.
//  Copyright © 2020 Пазин Даниил. All rights reserved.
//

import UIKit

struct Question {
    var easyQuestions: Dictionary<String, [String : Bool]> = [
        "Как называется экзотическое животное из Южной Америки?" : [ "пчеложор" : false,
                                                                     "термитоглот" : false,
                                                                     "муравьед" : true,
                                                                     "комаролов" : false],
        "К какой группе музыкальных инструментов относится валторна?" : ["струнные" : false,
                                                                         "клавишные" : false,
                                                                         "ударные" : false,
                                                                         "духовые" : true],
        "Как, образно говоря, способный человек впитывает знания?" : ["как тряпка" : false,
                                                                      "как губка" : true,
                                                                      "как газета" : false,
                                                                      "как промокашка" : false],
        "Что есть у ботинка?" : ["подбородочек" : false,
                                 "язычок" : true,
                                 "глазок" : false,
                                 "зубки" : false],
        "На что опирается в своей деятельности политическая партия?" : ["на перрон" : false,
                                                                        "на шасси" : false,
                                                                        "на платформу" : true,
                                                                        "на подиум" : false],
        "Как на Руси называлась небольшая комната, обычно в верхней части дома?" : ["светелка" : true,
                                                                                    "горелка" : false,
                                                                                    "огневка" : false,
                                                                                    "теплушка" : false],
        "На кого, как говорят, списывают неудачу в каком-либо деле?" : ["на машиниста" : false,
                                                                        "на стрелочника" : true,
                                                                        "на кочегара" : false,
                                                                        "на кондуктора" : false],
        "Какую птицу вспоминают, когда говорят, что у кого-то не все в порядке с головой?" : ["ворониху" : false,
                                                                                              "страусиху" : false,
                                                                                              "орлицу" : false,
                                                                                              "кукушку" : true],
        "Как можно назвать главный город страны?" : ["настольный" : false,
                                                     "столовый" : false,
                                                     "стольный" : true,
                                                     "застольный" : false],
        "Какая коза фигурирует в известном фразеологизме?" : ["матвеева" : false,
                                                              "егорова" : false,
                                                              "еремина" : false,
                                                              "сидорова" : true],
        "Куда Корней Чуковский в стихотворении \"Бармалей\" советовал детям не ходить?" : ["в Азию" : false,
                                                                                           "в Африку" : true,
                                                                                           "в Америку" : false,
                                                                                           "в Антарктиду" : false]]
    var normalQuestions: Dictionary<String, [String : Bool]> = [
        "В какой басне Крылова среди действующих лиц есть человек?" : ["\"Лягушка и Вол\"" : false,
                                                                       "\"Свинья под Дубом\"" : false,
                                                                       "\"Осел и Соловей\"" : false,
                                                                       "\"Волк на псарне\"" : true],
        "Какой фильм сделал знаменитой песню в исполнении Уитни Хьюстон?" : ["\"Красотка\"" : false,
                                                                             "\"Телохранитель\"" : true,
                                                                             "\"Форрест Гамп\"" : false,
                                                                             "\"Пятый элемент\"" : false],
        "Кому в работе нужны постромки?" : ["врачу" : false,
                                            "кузнецу" : false,
                                            "извозчику" : true,
                                            "охотнику" : false],
        "Какой писатель сформулировал Три закона робототехники?" : ["Карел Чапек" : false,
                                                                    "Айзек Азимов" : true,
                                                                    "Станислав Лем" : false,
                                                                    "Курт Воннегут" : false],
        "Какой советский орден был единственным, выпускавшимся не на монетном дворе?" : ["орден Александра Невского" : false,
                                                                                         "орден \"Победа\"" : true,
                                                                                         "орден Отечественной войны" : false,
                                                                                         "орден Трудового Красного Знамени" : false],
        "Как называется один из видов жуков?" : ["артиллерист" : false,
                                                 "командор" : false,
                                                 "канонир" : false,
                                                 "бомбардир" : true]]
    var hardQuestions: Dictionary<String, [String : Bool]> = [
        "Что в старину располагалось в Хельсинки на площади Наринкка?" : ["тюрьма" : false,
                                                                          "кладбище" : false,
                                                                          "торговые ряды" : true,
                                                                          "больница" : false],
        "Какое имя дал поручику Ржевскому автор пьесы \"Давным-давно\" Гладков?" : ["Михаил" : false,
                                                                                "Дмитрий" : true,
                                                                                "Василий" : false,
                                                                                "Александр" : false],
        "Чем увлекался знаменитый сказочник Ганс-Христан Андерсен?" : ["вязанием" : false,
                                                                       "вырезанием из бумаги" : true,
                                                                       "выжиганием" : false,
                                                                       "выпиливанием лобзиком" : false],
        "Во что оборачивают на время созревания сыр ярг, который производят в английском графстве Корнуолл?" : ["в мох" : false,
                                                                                                                "в навозные лепешки" : false,
                                                                                                                "в листья крапивы" : true,
                                                                                                                "в торф" : false],
        "Что не входило в обязанности первых стюардесс?" : ["заправлять самолет" : false,
                                                            "носить багаж" : false,
                                                            "кормить пассажиров" : true,
                                                            "уничтожать мух" : false]]
}


