//
//  BooleanExpression.swift
//  MasterOfBoolean
//
//  Created by Ivan Druzhinin on 13.08.2021.
//

import Foundation


indirect enum BooleanExpression {
    case conjunction(left: BooleanExpression, right: BooleanExpression)
    case disjunction(left: BooleanExpression, right: BooleanExpression)
    case not(BooleanExpression)
    case operand(Bool)
}
