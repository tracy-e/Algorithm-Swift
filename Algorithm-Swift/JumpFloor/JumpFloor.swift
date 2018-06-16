//
//  JumpFloor.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/16.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 一只青蛙一次可以跳上1级台阶，也可以跳上2级。求该青蛙跳上一个n级的台阶总共有多少种跳法。
 *
 **************************************************************************************************/

class JumpFloor {
    
    class Solution {
        
        func jumpFloor(n: Int) -> Int {
            guard n > 2 else {
                return n
            }
            var nMinusOne = 2
            var nMinusTwo = 1
            var result = 0
            for _ in 3...n {
                result = nMinusOne + nMinusTwo
                nMinusTwo = nMinusOne
                nMinusOne = result
            }
            return result
        }
        
    }
    
}

extension JumpFloor: Testable {
    
    static func runTests() {
        let solution = Solution()
        assert(solution.jumpFloor(n: 0) == 0)
        assert(solution.jumpFloor(n: 1) == 1)
        assert(solution.jumpFloor(n: 2) == 2)
        assert(solution.jumpFloor(n: 3) == 3)
        assert(solution.jumpFloor(n: 4) == 5)
    }
    
}


/***************************************************************************************************
 *
 * 变态跳台阶
 * 一只青蛙一次可以跳上1级台阶，也可以跳上2级……它也可以跳上n级。求该青蛙跳上一个n级的台阶总共有多少种跳法。
 *
 **************************************************************************************************/

class JumpFloorII {
    
    class Solution {
        func jumpFloorII(n: Int) -> Int {
            return n > 2 ? 1 << (n - 1) : n
        }
    }
    
}

extension JumpFloorII: Testable {
    
    static func runTests() {
        let solution = Solution()
        assert(solution.jumpFloorII(n: 1) == 1)
        assert(solution.jumpFloorII(n: 2) == 2)
        assert(solution.jumpFloorII(n: 3) == 4)
        assert(solution.jumpFloorII(n: 4) == 8)
    }
    
}
