//
//  FindMinimumInRotatedSortedArray.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/16.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。
 * 输入一个非递减排序的数组的一个旋转，输出旋转数组的最小元素。
 * 例如数组 [3,4,5,1,2] 为 [1,2,3,4,5] 的一个旋转，该数组的最小值为1。
 *
 **************************************************************************************************/

class FindMinimumInRotatedSortedArray {
    
    class Solution {
        
        func findMin(nums: [Int]) -> Int {
            if nums.count == 0 {
                return -1
            }
            if nums.count == 1 {
                return nums[0]
            }
            
            var start = 0
            var end = nums.count - 1
            var minIndex = start
            while nums[start] >= nums[end] {
                if end - start == 1 {
                    minIndex = end
                    break
                }
                minIndex = (start + end) / 2
                
                if nums[start] == nums[minIndex] && nums[minIndex] == nums[end] {
                    return self.findMinInOrder(nums: nums, start: start, end: end)
                }
                
                if nums[start] <= nums[minIndex] {
                    start = minIndex
                } else if nums[minIndex] <= nums[end] {
                    end = minIndex
                }
            }
            return nums[minIndex]
        }
        
        func findMinInOrder(nums: [Int], start: Int, end: Int) -> Int {
            var result = nums[0]
            for num in nums[start...end] where num < result {
                result = num
            }
            return result
        }
        
    }
}

extension FindMinimumInRotatedSortedArray: Testable {
    
    static func runTests() {
        let solution = Solution()
        assert(solution.findMin(nums: [1]) == 1)
        assert(solution.findMin(nums: [1, 2]) == 1)
        assert(solution.findMin(nums: [3, 4, 5, 1, 2]) == 1)
        assert(solution.findMin(nums: [4, 5, 6, 7, 0, 1, 2]) == 0)
        assert(solution.findMin(nums: [2, 2, 2, 0, 1]) == 0)
        assert(solution.findMin(nums: [2, 0, 1, 1, 1]) == 0)
        assert(solution.findMin(nums: [2, 1, 2]) == 1)
        assert(solution.findMin(nums: [10, 1, 10, 10, 10]) == 1)
    }
    
}
