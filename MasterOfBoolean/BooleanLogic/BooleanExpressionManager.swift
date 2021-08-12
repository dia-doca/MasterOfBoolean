//
//  BooleanExpressionManager.swift
//  MasterOfBoolean
//
//  Created by Ivan Druzhinin on 13.08.2021.
//

import Foundation


class BooleanExpressionManager {
    
    var difficultyLevel: DifficultyLevel = .easy
    
    var currentExpression: String { booleanExpressionProcessor.stringFromBooleanExpression(currentBooleanExpression) }
    
    var currentEvaluation: Bool { booleanExpressionProcessor.calculateBooleanExpression(currentBooleanExpression) }
    
    private var currentBooleanExpression: BooleanExpression = .operand(true)
    
    private let booleanExpressionProcessor = BooleanExpressionProcessor()
    
    func generateNewExpression() {
        currentBooleanExpression = booleanExpressionProcessor.generateBooleanExpression(with: difficultyLevel)
    }
    
}
