//
//  MinStack.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/19.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 定义栈的数据结构，请在该类型中实现一个能够得到栈最小元素的min函数。
 *
 **************************************************************************************************/

class MinStack {
    
    class Solution {
        var stack1: [Int] = []
        var stack2: [Int] = []
        
        func push(_ node: Int) {
            self.stack1.append(node)
            if self.stack2.count == 0 {
                self.stack2.append(node)
            } else {
                let min = self.stack2.last!
                self.stack2.append(node < min ? node : min)
            }
        }
        
        func pop() -> Int? {
            let _ = self.stack2.popLast()
            return self.stack1.popLast()
        }
        
        func top() -> Int? {
            return self.stack1.last
        }
        
        func min() -> Int? {
            return self.stack1.last
        }
    }
    
}

extension MinStack: Testable {
    
    static func runTests() {
        let solution = Solution()
        solution.push(-2)
        solution.push(0)
        solution.push(-3)
        assert(solution.min() == -3)
        assert(solution.top() == -3)
        let _ = solution.pop()
        let _ = solution.pop()
        assert(solution.min() == -2)
    }
    
}
