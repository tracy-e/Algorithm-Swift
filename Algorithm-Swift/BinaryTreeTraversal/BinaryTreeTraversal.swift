//
//  BinaryTreeTraversal.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/19.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 从上往下打印出二叉树的每个节点，同层节点从左至右打印。
 *
 **************************************************************************************************/


class BinaryTreeTraversal {
    
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
        
        // 从上到下分层遍历二叉树
        func levelTraversal(_ root: TreeNode?) -> [Int] {
            if let root = root {
                var queue: [TreeNode] = [root]
                var result: [Int] = []
                while queue.count > 0 {
                    let node = queue.first!
                    queue.remove(at: 0)
                    result.append(node.val)
                    if let left = node.left {
                        queue.append(left)
                    }
                    if let right = node.right {
                        queue.append(right)
                    }
                }
                return result
            }
            return []
        }
        
        // 二叉树的前序遍历
        func preorderTraversal(_ root: TreeNode?) -> [Int] {
            if let root = root {
                var stack: [TreeNode] = [root]
                var result: [Int] = []
                while stack.count > 0 {
                    let node = stack.popLast()!
                    result.append(node.val)
                    if let right = node.right {
                        stack.append(right)
                    }
                    if let left = node.left {
                        stack.append(left)
                    }
                }
                return result
            }
            return []
        }
        
        // 二叉树的中序遍历
        func inorderTraversal(_ root: TreeNode?) -> [Int] {
            if let root = root {
                
            }
            return []
        }
        
        // 二叉树的后序遍历
        func postorderTraversal(_ root: TreeNode?) -> [Int] {
            
            return []
        }
    }
    
}

extension BinaryTreeTraversal: Testable {
    
    static func tree1() -> TreeNode {
        let tree = TreeNode(1)
        tree.left = TreeNode(2)
        tree.left?.right = TreeNode(3)
        return tree
    }
    
    static func tree2() -> TreeNode {
        let tree = TreeNode(8)
        tree.left = TreeNode(6)
        tree.right = TreeNode(10)
        tree.left?.left = TreeNode(5)
        tree.left?.right = TreeNode(7)
        tree.right?.left = TreeNode(9)
        tree.right?.right = TreeNode(11)
        return tree
    }
    
    static func testLevelTraversal() {
        let solution = Solution()
        assert(solution.levelTraversal(nil) == [])
        assert(solution.levelTraversal(TreeNode(1)) == [1])
        assert(solution.levelTraversal(tree1()) == [1, 2, 3])
        assert(solution.levelTraversal(tree2()) == [8, 6, 10, 5, 7, 9, 11])
    }
    
    static func testPreorderTraversal() {
        let solution = Solution()
        assert(solution.preorderTraversal(nil) == [])
        assert(solution.preorderTraversal(TreeNode(1)) == [1])
        assert(solution.preorderTraversal(tree1()) == [1, 2, 3])
        assert(solution.preorderTraversal(tree2()) == [8, 6, 5, 7, 10, 9, 11])
    }
    
    static func runTests() {
        testLevelTraversal()
        testLevelTraversal()
    }
    
}
