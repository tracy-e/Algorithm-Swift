//
//  StackPushPopMatch.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/19.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 输入两个整数序列，第一个序列表示栈的压入顺序，请判断第二个序列是否为该栈的弹出顺序。假设压入栈的所有数字均不相等。
 * 例如序列 1, 2, 3, 4, 5 是某栈的压入顺序，序列 4, 5, 3, 2, 1 是该压栈序列对应的一个弹出序列，但 4, 3, 5, 1, 2
 * 就不可能是该压栈序列的弹出序列。（注意：这两个序列的长度是相等的）
 *
 **************************************************************************************************/

class StackPushPopMatch {
    
    class Solution {
        
        func isMatch(_ pushV: [Int], _ popV: [Int]) -> Bool {
            if pushV.count == 0 || popV.count == 0 ||  pushV.count != popV.count {
                return false
            }
            var count = 0
            var stack: [Int] = []
            for p in popV {
                if stack.last == p {
                    let _ = stack.popLast()
                } else if let index = pushV.index(of: p), count <= index {
                    for i in count...index {
                        count+=1
                        stack.append(pushV[i])
                    }
                    let _ = stack.popLast()
                } else {
                    return false
                }
            }
            return true
        }
    }
    
}

extension StackPushPopMatch: Testable {
    
    static func runTests() {
        let solution = Solution()
        assert(solution.isMatch([], []) == false)
        assert(solution.isMatch([1], [1]))
        assert(solution.isMatch([1, 2, 3], [3, 2, 1]))
        assert(solution.isMatch([1, 2, 3], [2, 3, 1]))
        assert(solution.isMatch([1, 2, 3], [1, 2, 3]))
        assert(solution.isMatch([1, 2, 3, 4, 5], [4, 5, 3, 2, 1]))
        assert(solution.isMatch([1, 2, 3, 4, 5], [4, 3, 5, 1, 2]) == false)
    }
    
}
