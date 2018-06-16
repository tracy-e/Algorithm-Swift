//
//  PowerOfBase.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/16.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 给定一个double类型的浮点数base和int类型的整数n。求base的n次方。
 *
 **************************************************************************************************/


class PowerOfBase {
    
    class Solution {
        
        func power(_ base: Double, _ n: Int) -> Double {
            if n == 0 {
                return 1
            }
            let absN = n > 0 ? n : -n
            var result = self.powerWithUnsigned(base, absN)
            if n < 0 {
                result = 1.0 / result
            }
            return result
        }
        
        private func powerWithUnsigned(_ base: Double, _ n: Int) -> Double {
            if n == 0 {
                return 1
            }
            if n == 1 {
                return base
            }
            
            var result = self.powerWithUnsigned(base, n >> 1)
            result *= result
            if n & 0x1 == 1 {
                result *= base
            }
            return result
        }
    }
}

extension PowerOfBase: Testable {
    
    static func runTests() {
        let solution = Solution()
        assert(solution.power(10, 0) == 1)
        assert(solution.power(1, 1) == 1)
        print(solution.power(2, 10) == 1024)
        assert(solution.power(5, -1) == 0.2)
        assert(solution.power(5, -2) == 0.04)
    }
}
