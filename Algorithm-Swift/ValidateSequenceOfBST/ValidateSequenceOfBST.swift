//
//  ValidateSequenceOfBST.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/21.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历的结果。如果是则输出Yes,否则输出No。
 * 假设输入的数组的任意两个数字都互不相同。
 *
 **************************************************************************************************/

class ValidateSequenceOfBST {
    
    class Solution {
        
        func isValidBinarySearchTree(_ sequence: [Int]) -> Bool {
            guard sequence.count > 0 else {
                return false
            }
            let root = sequence.last!
            
            var i = 0
            for node in sequence where node < root {
                i+=1
            }
            for j in i..<(sequence.count - 1) {
                if sequence[j] < root {
                    return false
                }
            }
            var left = true
            if i > 0 {
                left = self.isValidBinarySearchTree(Array(sequence[0..<i]))
            }
            var right = true
            if i < sequence.count - 1 {
                right = self.isValidBinarySearchTree(Array(sequence[i..<(sequence.count - 1)]))
            }
            return left && right
        }
        
    }
    
}

extension ValidateSequenceOfBST: Testable {
    
    static func runTests() {
        let solution = Solution()
        assert(solution.isValidBinarySearchTree([]) == false)
        assert(solution.isValidBinarySearchTree([1]))
        assert(solution.isValidBinarySearchTree([1, 2]))
        assert(solution.isValidBinarySearchTree([2, 1]))
        assert(solution.isValidBinarySearchTree([1, 3, 2]))
        assert(solution.isValidBinarySearchTree([7, 4, 6, 5]) == false)
        assert(solution.isValidBinarySearchTree([5, 7, 6, 9, 11, 10, 8]))
    }
    
}
