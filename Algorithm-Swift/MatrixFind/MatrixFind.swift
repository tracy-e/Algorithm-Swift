//
//  MatrixFind.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/16.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的
 * 一个二维数组和一个整数，判断数组中是否含有该整数。
 *
 * 例如在下面的二维数组中查找数字7，应该返回true；如果查找数字5，返回false.
 *
 *  1  2  8  9
 *  2  4  9  12
 *  4  7  10 13
 *  6  8  11 15
 *
 **************************************************************************************************/

class MatrixFind {
    
    class Solution {
        func find(matrix: [[Int]], target: Int) -> Bool {
            let rows = matrix.count
            guard let cols = matrix.first?.count else { return false }
            
            var row = 0
            var col = cols - 1
            while row < rows && col >= 0 {
                let item = matrix[row][col]
                if item == target {
                    return true
                } else if item < target {
                    row+=1
                } else {
                    col-=1
                }
            }
            return false
        }
    }

}

extension MatrixFind: Testable {
    
    static func runTests() {
        let solution = Solution()
        assert(solution.find(matrix: [], target: 0) == false)
        assert(solution.find(matrix: [[1]], target: 0) == false)
        assert(solution.find(matrix: [[1]], target: 1))
        assert(solution.find(matrix: [[1], [2], [3]], target: 4) == false)
        assert(solution.find(matrix: [[1], [2], [3]], target: 3))
        
        let matrix =  [[1, 2, 8, 9],
                       [2, 4, 9, 12],
                       [4, 7, 10, 13],
                       [6, 8, 11, 15]]
        assert(solution.find(matrix: matrix, target: 5) == false)
        assert(solution.find(matrix: matrix, target: 7))
    }
    
}


