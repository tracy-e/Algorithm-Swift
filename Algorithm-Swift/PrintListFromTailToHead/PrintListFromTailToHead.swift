//
//  PrintListFromTailToHead.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/16.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 输入一个链表，从尾到头打印链表每个节点的值。
 * 如输入链表的值的顺序为1、2、3，返回[3, 2, 1]
 *
 **************************************************************************************************/

class PrintListFromTailToHead {

    class ListNode {
        var val: Int
        var next: ListNode?
        init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    class Solution {
        func printListFromTailToHead(listNode: ListNode?) -> [Int] {
            if let root = listNode {
                return self.printListFromTailToHead(listNode: root.next) + [root.val]
            }
            return []
        }
    }
}

extension PrintListFromTailToHead: Testable {
    
    static func runTests() {
        let solution = self.Solution()
        assert(solution.printListFromTailToHead(listNode: nil) == [])
        assert(solution.printListFromTailToHead(listNode: ListNode(1)) == [1])
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        node1.next = node2
        node2.next = node3
        assert(solution.printListFromTailToHead(listNode: node1) == [3, 2, 1])
    }
    
}
