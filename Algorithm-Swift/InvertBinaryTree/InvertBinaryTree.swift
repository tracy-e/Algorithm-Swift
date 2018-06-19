//
//  InvertBinaryTree.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/19.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 翻转一颗二叉树
 *
 *          4                              4
 *         / \                            / \
 *        2   7           ->             7   2
 *       / \  / \                       /\   /\
 *      1   3 6  9                     9  6 3  1
 *
 **************************************************************************************************/

class InvertBinaryTree {
    
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
        
        func invertTree(_ root: TreeNode?) -> TreeNode? {
            guard let root = root else {
                return nil
            }
            let node = TreeNode(root.val)
            node.left = self.invertTree(root.right)
            node.right = self.invertTree(root.left)
            return node
        }
        
    }
    
}

extension InvertBinaryTree: Testable {
    
    static func runTests() {
        let solution = Solution()
        assert(solution.invertTree(nil) == nil)
        assert(solution.invertTree(TreeNode(1))?.val == 1)
        
        let tree1 = TreeNode(4)
        tree1.left = TreeNode(2)
        tree1.right = TreeNode(7)
        tree1.left?.left = TreeNode(1)
        tree1.left?.right = TreeNode(3)
        tree1.right?.left = TreeNode(6)
        tree1.right?.right = TreeNode(9)
        let inverted1 = solution.invertTree(tree1)
        assert(inverted1?.val == 4)
        assert(inverted1?.left?.val == 7)
        assert(inverted1?.right?.val == 2)
        assert(inverted1?.left?.left?.val == 9)
        assert(inverted1?.left?.right?.val == 6)
        assert(inverted1?.right?.left?.val == 3)
        assert(inverted1?.right?.right?.val == 1)
    }
    
}
