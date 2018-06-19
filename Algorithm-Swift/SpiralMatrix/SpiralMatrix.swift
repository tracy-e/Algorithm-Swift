//
//  SpiralMatrix.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/19.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字
 *
 *  [
 *  [1, 2, 3, 4],
 *  [5, 6, 7, 8],
 *  [9, 10, 11, 12],
 *  [13, 14, 15, 16]
 *  ]
 * 输出： [1, 2, 3, 4, 8, 12, 16, 15, 14, 13, 9, 5, 6, 7, 11, 10]
 *
 **************************************************************************************************/

class SpiralMatrix {
    
    class Solution {
        
        func spiralOrder(_ matrix: [[Int]]) -> [Int] {
            let rows = matrix.count
            guard let cols = matrix.first?.count else {
                return []
            }
            if rows == 0 {
                return []
            }
            if rows == 1 {
                return matrix[0]
            }
            
            var start = 0
            var result: [Int] = []
            while start < (rows + 1) / 2 && start < (cols + 1) / 2 {
                let maxX = cols - 1 - start
                let maxY = rows - 1 - start
                
                for i in start...maxX {
                    result.append(matrix[start][i])
                }
                if start < maxY {
                    for i in (start + 1)...maxY {
                        result.append(matrix[i][maxX])
                    }
                }
                if start < maxX && start < maxY {
                    for i in stride(from: maxX - 1, to: start - 1, by: -1) {
                        result.append(matrix[maxY][i])
                    }
                }
                if start < maxX && start < maxY - 1  {
                    for i in stride(from: maxY - 1, to: start, by: -1) {
                        result.append(matrix[i][start])
                    }
                }
                
                start+=1
            }
            return result
        }
    }
    
}

extension SpiralMatrix: Testable {
    
    static func runTests() {
        let solution = Solution()
        assert(solution.spiralOrder([]) == [])
        assert(solution.spiralOrder([[1, 2]]) == [1, 2])
        assert(solution.spiralOrder([[1], [2]]) == [1, 2])
        assert(solution.spiralOrder([[1, 2], [3, 4]]) == [1, 2, 4, 3])
        assert(solution.spiralOrder([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) == [1, 2, 3, 6, 9, 8, 7, 4, 5])
        assert(solution.spiralOrder([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]) == [1, 2, 3, 4, 8, 12, 16, 15, 14, 13, 9, 5, 6, 7, 11, 10])
    }
    
}
