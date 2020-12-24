//
//  ViewController.swift
//  Who Wants to Be a Millionaire?.git
//
//  Created by Пазин Даниил on 02.06.2020.
//  Copyright © 2020 Пазин Даниил. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

   // Уровень сложности.
    var difficulty: DifficultyLevels = .graduation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let gameVC = segue.destination as? GameViewController else { return }
            gameVC.difficulty = self.difficulty
        default:
            break
        }
    }
}
// MARK: - IBActions
extension MainMenuViewController {
    @IBAction func cancelToMainMenuViewController(_ segue: UIStoryboardSegue) {
    }
}

