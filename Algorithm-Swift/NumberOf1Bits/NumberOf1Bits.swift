//
//  NumberOf1Bits.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/16.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 输入一个整数，输出该数二进制表示中1的个数。其中负数用补码表示。
 *
 **************************************************************************************************/

class NumberOf1Bits {
    
    class Solution {
        
        func numberOf1Bits(n: Int) -> Int {
            var count = 0
            var num = n
            while num > 0 {
                count+=1
                num = num & (num - 1)
            }
            return count
        }
    }
    
}

extension NumberOf1Bits: Testable {
    
    static func runTests() {
        let solution =  Solution()
        assert(solution.numberOf1Bits(n: 0) == 0)
        assert(solution.numberOf1Bits(n: 1) == 1)
        assert(solution.numberOf1Bits(n: 2) == 1)
        assert(solution.numberOf1Bits(n: 3) == 2)
        assert(solution.numberOf1Bits(n: 64) == 1)
        assert(solution.numberOf1Bits(n: 255) == 8)
    }
    
}
