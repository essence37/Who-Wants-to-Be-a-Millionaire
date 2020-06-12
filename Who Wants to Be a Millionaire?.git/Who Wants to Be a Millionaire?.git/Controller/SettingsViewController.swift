//
//  SettingsViewController.swift
//  Who Wants to Be a Millionaire?.git
//
//  Created by Пазин Даниил on 10.06.2020.
//  Copyright © 2020 Пазин Даниил. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    // MARK: - IBActions
    @IBAction func backToMainMenuTapped(_ sender: Any) {
        performSegue(withIdentifier: "cancelToMainMenu", sender: self)
    }
    @IBAction func cancelToSettingsViewController(_ segue: UIStoryboardSegue) {
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var difficultyControl: UISegmentedControl!
    
    // MARK: - Переменные и константы.
    // Свойство «сложность», исходя из выделенного сегмента.
    var selectedDifficulty: DifficultyLevels {
        switch self.difficultyControl.selectedSegmentIndex {
        case 0:
            return .graduation
        case 1:
            return .easy
        case 2:
            return .normal
        case 3:
            return .hard
        default:
            return .graduation
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "cancelToMainMenu":
            guard let gameVC = segue.destination as? MainMenuViewController else { return }
            gameVC.difficulty = self.selectedDifficulty
            Game.shared.difficultyLevel = self.selectedDifficulty
        default:
            break
        }

    }

}
