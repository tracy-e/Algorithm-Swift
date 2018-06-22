//
//  BinaryTreePathSumEqualsX.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/21.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 输入一颗二叉树和一个整数，打印出二叉树中结点值的和为输入整数的所有路径。
 * 路径定义为从树的根结点开始往下一直到叶结点所经过的结点形成一条路径。
 *
 **************************************************************************************************/

class BinaryTreePathSumEqualsX {
    
    class TreeNode {
        var val: Int
        var left: TreeNode?
        var right: TreeNode?
        init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }
    
    class Solution {
        
        func findPaths(_ root: TreeNode?, sum: Int) -> [[Int]] {
            var paths: [[Int]] = []
            let path: [Int] = []
            BFS(root, sum: sum, paths: &paths, path: path)
            return paths
        }
        
        private func BFS(_ root: TreeNode?, sum: Int, paths: inout [[Int]], path: [Int]? = nil) {
            guard let root = root else { return }
            var path: [Int] = path ?? []
            path.append(root.val)
            if root.left == nil && root.right == nil {
                if sum == path.reduce(0) { $0 + $1 } {
                    paths.append(path)
                }
                return
            }
            if let left = root.left {
                BFS(left, sum: sum, paths: &paths, path: path)
            }
            if let right = root.right {
                BFS(right, sum: sum, paths: &paths, path: path)
            }
        }
    }
    
}

extension BinaryTreePathSumEqualsX: Testable {
    
    static func runTests() {
        let solution = Solution()
        assert(solution.findPaths(nil, sum: 0) == [])
        assert(solution.findPaths(TreeNode(1), sum: 1) == [[1]])
        
        let tree = TreeNode(10)
        tree.left = TreeNode(5)
        tree.right = TreeNode(12)
        tree.left?.left = TreeNode(4)
        tree.left?.right = TreeNode(7)
        assert(solution.findPaths(tree, sum: 22) == [[10, 5, 7], [10, 12]])
    }
    
}
