//
//  Fibonacci.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/16.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 大家都知道斐波那契数列，现在要求输入一个整数n，请你输出斐波那契数列的第n项。
 *
 **************************************************************************************************/

class Fibonacci {
    
    class Solution {
        // Note: 不要使用递归方式，效率非常低
        func fibonacci(n: Int) -> Int {
            guard n > 1 else {
                return n
            }
            var nMinusOne = 1
            var nMinusTwo = 0
            var result = 0
            for _ in 2...n {
                result = nMinusOne + nMinusTwo
                nMinusTwo = nMinusOne
                nMinusOne = result
            }
            return result
        }
    }
    
}

extension Fibonacci: Testable {
    
    static func runTests() {
        let solution = Solution()
        assert(solution.fibonacci(n: 0) == 0)
        assert(solution.fibonacci(n: 1) == 1)
        assert(solution.fibonacci(n: 2) == 1)
        assert(solution.fibonacci(n: 3) == 2)
        assert(solution.fibonacci(n: 4) == 3)
        assert(solution.fibonacci(n: 23) == 28657)
        print(solution.fibonacci(n: 40) == 102334155)
    }
}
