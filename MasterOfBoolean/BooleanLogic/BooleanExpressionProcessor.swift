//
//  BooleanExpressionProcessor.swift
//  MasterOfBoolean
//
//  Created by Ivan Druzhinin on 13.08.2021.
//

import Foundation


class BooleanExpressionProcessor {

    func generateBooleanExpression(with difficultyLevel: DifficultyLevel) -> BooleanExpression {

        func generate(withDepth depth: Int) -> BooleanExpression {
            if depth == 1 {
                return .operand(Bool.random())
            } else {
                switch Int.random(in: 0...2) {
                case 0:
                    return .not(generate(withDepth: depth - 1))
                case 1:
                    return .conjunction(left: generate(withDepth: depth - 1), right: generate(withDepth: depth - 1))
                case 2:
                    return .disjunction(left: generate(withDepth: depth - 1), right: generate(withDepth: depth - 1))
                default:
                    return .operand(Bool.random())
                }
            }
        }

        switch difficultyLevel {
        case .easy:
            return generate(withDepth: 2)
        case .normal:
            return generate(withDepth: 4)
        case .hard:
            return generate(withDepth: 5)
        }

    }

    func calculateBooleanExpression(_ expression: BooleanExpression) -> Bool {
        switch expression {
        case .operand(let operand):
            return operand
        case .not(let expression):
            return !calculateBooleanExpression(expression)
        case .conjunction(let left, let right):
            return calculateBooleanExpression(left) && calculateBooleanExpression(right)
        case .disjunction(let left, let right):
            return calculateBooleanExpression(left) || calculateBooleanExpression(right)
        }
    }

    func stringFromBooleanExpression(_ expression: BooleanExpression) -> String {
        switch expression {
        case .operand(let isTrue):
            return isTrue ? "true" : "false"
        case .not(let expression):
            switch expression {
            case .operand, .disjunction:
                return "!\(stringFromBooleanExpression(expression))"
            default:
                return "!(\(stringFromBooleanExpression(expression)))"
            }
        case .conjunction(let left, let right):
            return "\(stringFromBooleanExpression(left)) && \(stringFromBooleanExpression(right))"
        case .disjunction(let left, let right):
            return "(\(stringFromBooleanExpression(left)) || \(stringFromBooleanExpression(right)))"
        }
    }

}

