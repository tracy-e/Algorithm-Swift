//
//  ImplementQueueWithStacks.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/16.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 用两个栈来实现一个队列，完成队列的Push和Pop操作。 队列中的元素为int类型。
 *
 **************************************************************************************************/

class ImplementQueueWithStacks {

    class Solution {
        var stack1: [Int] = []
        var stack2: [Int] = []
        
        func push(node: Int) {
            self.stack1.append(node)
        }
        
        func pop() -> Int? {
            if self.stack2.count == 0 {
                while self.stack1.count > 0 {
                    if let node = self.stack1.popLast() {
                        self.stack2.append(node)
                    }
                }
            }
            return self.stack2.popLast()
        }
    }
}

extension ImplementQueueWithStacks: Testable {
    
    static func runTests() {
        let solution = Solution()
        assert(solution.pop() == nil)
        solution.push(node: 1)
        assert(solution.pop() == 1)
        solution.push(node: 1)
        solution.push(node: 2)
        solution.push(node: 3)
        assert(solution.pop() == 1)
        assert(solution.pop() == 2)
        assert(solution.pop() == 3)
        assert(solution.pop() == nil)
    }
    
}
