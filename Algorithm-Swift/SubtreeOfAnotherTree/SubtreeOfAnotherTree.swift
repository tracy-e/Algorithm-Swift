//
//  SubtreeOfAnotherTree.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/19.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 输入两棵二叉树A，B，判断B是不是A的子结构。
 *
 **************************************************************************************************/

class SubtreeOfAnotherTree {
    
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
        
        // 判断 root2 是否为 root1 的子树
        func isSubtree(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
            guard let t = root1, let s = root2 else { return false }
            
            var result = false
            if t.val == s.val {
                result = self.isTree1HaveTree2(t, s)
            }
            if !result {
                result = self.isSubtree(t.left, s)
            }
            if !result {
                result = self.isSubtree(t.right, s)
            }
            return result
        }
        
        private func isTree1HaveTree2(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
            if root2 == nil {
                return true
            }
            if root1 == nil {
                return false
            }
            if root1?.val != root2?.val {
                return false
            }
            return self.isTree1HaveTree2(root1?.left, root2?.left)
                && self.isTree1HaveTree2(root1?.right, root2?.right)
        }
    }
    
}

extension SubtreeOfAnotherTree: Testable {
    
    static func runTests() {
        let solution = Solution()
        assert(solution.isSubtree(nil, nil) == false)
        assert(solution.isSubtree(TreeNode(1), nil) == false)
        assert(solution.isSubtree(TreeNode(1), TreeNode(1)))
        
        let tree1 = TreeNode(3)
        tree1.left = TreeNode(4)
        tree1.right = TreeNode(5)
        tree1.left?.left = TreeNode(1)
        tree1.left?.right = TreeNode(2)
        
        let tree2 = TreeNode(4)
        tree2.left = TreeNode(1)
        tree2.right = TreeNode(2)
        assert(solution.isSubtree(tree1, tree2))
        
    }
    
}
