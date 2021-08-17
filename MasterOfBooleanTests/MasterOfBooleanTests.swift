//
//  MasterOfBooleanTests.swift
//  MasterOfBooleanTests
//
//  Created by Ivan Druzhinin on 17.08.2021.
//

import XCTest
import MasterOfBoolean


class MasterOfBooleanTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testComplicatedBool() throws {

        let processor = BooleanExpressionProcessor()

        let expression1: BooleanExpression = .not(
            .conjunction(
                left: .disjunction(left: .operand(true), right: .operand(true)),
                right: .conjunction(left: .operand(true), right: .operand(false))
            )
        )
        XCTAssertEqual(processor.stringFromBooleanExpression(expression1), "!((true || true) && true && false)")
        XCTAssertTrue(processor.calculateBooleanExpression(expression1))

        let expression2: BooleanExpression = .not(
            .disjunction(
                left: .operand(true),
                right: .conjunction(left: .operand(true),
                                    right: .conjunction(left: .operand(true), right: .operand(false))
                )
            )
        )
        XCTAssertEqual(processor.stringFromBooleanExpression(expression2), "!(true || true && true && false)")
        XCTAssertFalse(processor.calculateBooleanExpression(expression2))

    }


}
