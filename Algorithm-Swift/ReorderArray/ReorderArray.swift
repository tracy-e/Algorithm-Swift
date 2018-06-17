//
//  ReorderArray.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/16.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有的奇数位于数组的前半部分，所有的偶数位于位于数组的后
 * 半部分，并保证奇数和奇数。
 *
 **************************************************************************************************/

class ReorderArray {
    
    class Solution {
        
        func reorderArray(_ array: inout [Int]) {
            guard array.count > 1 else {
                return
            }
            var start = 0
            var end = array.count - 1
            while start < end {
                while start < end && array[start] & 1 == 1 {
                    start+=1
                }
                while start < end && array[end] & 1 == 0 {
                    end-=1
                }
                if start < end {
                    let temp = array[start]
                    array[start] = array[end]
                    array[end] = temp
                }
            }
        }
    }
    
}

extension ReorderArray: Testable {
    
    static func runTests() {
        let solution = Solution()
        var array1: [Int] = []
        solution.reorderArray(&array1)
        assert(array1 == [])
        
        var array2 = [1]
        solution.reorderArray(&array2)
        assert(array2 == [1])
        
        var array3 = [2, 1]
        solution.reorderArray(&array3)
        assert(array3 == [1, 2])
        
        var array4 = [1, 2, 3, 4, 5]
        solution.reorderArray(&array4)
        assert(array4 == [1, 5, 3, 4, 2])
    }
    
}

/***************************************************************************************************
 *
 *  如果要求排序后奇数和偶数之间的相对位置保持不变，及[1, 2, 3, 4, 5] -> [1, 3, 5, 2, 4]
 *
 **************************************************************************************************/

class ReorderArrayII {
    
    class Solution {
        
        func reorderArray(_ array: inout [Int]) {
            guard array.count > 0 else {
                return
            }
            for _ in 0..<array.count {
                for j in 0..<(array.count - 1) {
                    if array[j] & 1 == 0 && array[j + 1] & 1 == 1 {
                        let temp = array[j]
                        array[j] = array[j + 1]
                        array[j + 1] = temp
                    }
                }
            }
        }
        
    }
    
}

extension ReorderArrayII: Testable {
    
    static func runTests() {
        let solution = Solution()
        var array1: [Int] = []
        solution.reorderArray(&array1)
        assert(array1 == [])
        
        var array2 = [1]
        solution.reorderArray(&array2)
        assert(array2 == [1])
        
        var array3 = [2, 1]
        solution.reorderArray(&array3)
        assert(array3 == [1, 2])
        
        var array4 = [1, 2, 3, 4, 5]
        solution.reorderArray(&array4)
        assert(array4 == [1, 3, 5, 2, 4])
        
        var array5 = [2, 4, 5, 6, 3, 1]
        solution.reorderArray(&array5)
        assert(array5 == [5, 3, 1, 2 ,4, 6])
    }
    
}
