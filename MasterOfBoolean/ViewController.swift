//
//  ViewController.swift
//  MasterOfBoolean
//
//  Created by Ivan Druzhinin on 12.08.2021.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var difficultyLevelControl: UISegmentedControl!

    @IBOutlet weak var taskLabel: UILabel!

    // MARK: - Private Services

    let booleanExpressionManager = BooleanExpressionManager()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setDifficultyLevel()
        generateNewExpression()
    }

    // MARK: - Actions

    @IBAction func actionTrue(_ sender: UIButton) {
        handleAnswer(true)
    }

    @IBAction func actionFalse(_ sender: UIButton) {
        handleAnswer(false)
    }

    @IBAction func didChangeDifficultyLevel(_ sender: UISegmentedControl) {
        setDifficultyLevel()
        generateNewExpression()
    }

    // MARK: - Private functions

    private func setDifficultyLevel() {
        let difficultyLevel = DifficultyLevel(rawValue: difficultyLevelControl.selectedSegmentIndex) ?? .easy
        booleanExpressionManager.difficultyLevel = difficultyLevel
    }

    private func generateNewExpression() {
        booleanExpressionManager.generateNewExpression()
        taskLabel.text = booleanExpressionManager.currentExpression
    }

    private func isCorrect(result: Bool) -> Bool {
        booleanExpressionManager.currentEvaluation == result
    }

    private func handleAnswer(_ answer: Bool) {
        if isCorrect(result: answer) {
            presentAlert(title: "Отлично!", message: "Ответ \(answer)", completion: { [weak self] in self?.generateNewExpression() })
        } else {
            presentAlert(title: "Неверно!", message: "Подумай еще = )", completion: nil)
        }
    }

    private func presentAlert(title: String, message: String, completion handler: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "OK", style: .default, handler: { _ in
                handler?()
            })
        )
        present(alert, animated: true, completion: nil)
    }

}
