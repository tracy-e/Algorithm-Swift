//
//  RebuildBinaryTree.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/16.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 输入某二叉树的前序遍历和中序遍历的结果，请重建出该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。
 * 例如输入前序遍历序列[1,2,4,7,3,5,6,8]和中序遍历序列[4,7,2,1,5,3,8,6]，则重建二叉树并返回。
 *
 *          1
 *         / \
 *        2   3
 *       /    / \
 *      4    5   6
 *       \      /
 *        7    8
 *
 **************************************************************************************************/

class RebuildBinaryTree {

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
        func rebuildBinaryTree(pre: [Int], tin: [Int]) -> TreeNode? {
            guard pre.count > 0 && tin.count > 0 && pre.count == pre.count else {
                return nil
            }
            for item in pre where !tin.contains(item) {
                return nil
            }
            
            let rootValue = pre[0]
            let rootNode = TreeNode(rootValue)
            
            let leaves = tin.split(separator: rootValue, maxSplits: 1, omittingEmptySubsequences: false).map { Array($0) }
            let leftTin = leaves[0]
            let rightTin = leaves[1]
            if leftTin.count > 0 {
                rootNode.left = self.rebuildBinaryTree(pre: Array(pre[1...leftTin.count]), tin: leftTin)
            }
            if rightTin.count > 0 {
                rootNode.right = self.rebuildBinaryTree(pre: Array(pre[(1 + leftTin.count)...]), tin: rightTin)
            }
            return rootNode
        }
    }
}

extension RebuildBinaryTree: Testable {
    
    static func runTests() {
        let solution = self.Solution()
        assert(solution.rebuildBinaryTree(pre: [], tin: []) == nil)
        assert(solution.rebuildBinaryTree(pre: [1, 2], tin: [1]) == nil)
        let tree = solution.rebuildBinaryTree(pre: [1, 2, 4, 7, 3, 5, 6, 8], tin: [4, 7, 2, 1, 5, 3, 8, 6])
        assert(tree!.val == 1)
        assert(tree!.left!.val == 2)
        assert(tree!.right!.val == 3)
        assert(tree!.left!.left!.val == 4)
        assert(tree!.right!.left!.val == 5)
        assert(tree!.right!.right!.val == 6)
        assert(tree!.right!.right!.left!.val == 8)
        assert(tree!.left!.left!.right!.val == 7)
    }
    
}
