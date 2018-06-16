//
//  Algorithm_SwiftTests.swift
//  Algorithm-SwiftTests
//
//  Created by TracyYih on 2018/6/16.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

import XCTest
@testable import Algorithm_Swift

class Algorithm_SwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMatrixFind() {
        MatrixFind.runTests()
    }
    
    func testPrintListFromTailToHead() {
        PrintListFromTailToHead.runTests()
    }
    
    func testRebuildBinaryTree() {
        RebuildBinaryTree.runTests()
    }
    
    func testImplementQueueWithStacks() {
        ImplementQueueWithStacks.runTests()
    }
    
    func testFindMinimumInRotatedSortedArray() {
        FindMinimumInRotatedSortedArray.runTests()
    }
    
    func testFibonacci() {
        Fibonacci.runTests()
    }
    
    func testJumpFloor() {
        JumpFloor.runTests()
        JumpFloorII.runTests()
    }
    
    func testNumberOf1Bits() {
        NumberOf1Bits.runTests()
    }
    
    func testPowerOfBase() {
        PowerOfBase.runTests()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
