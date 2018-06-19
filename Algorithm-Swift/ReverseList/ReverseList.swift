//
//  ReverseList.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/18.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 输入一个链表，反转链表后，输出链表的所有元素。
 *
 **************************************************************************************************/

class ReverseList {
    
    class ListNode {
        var val: Int
        var next: ListNode?
        init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    class Solution {
        
        func reverseList(_ head: ListNode?) -> ListNode? {
            var node = head
            var rHead: ListNode? = nil
            while node != nil {
                let next = node!.next
                node!.next = rHead
                rHead = node
                node = next
            }
            return rHead
        }
        
    }
}

extension ReverseList: Testable {
    
    static func runTests() {
        let solution = Solution()
        
        assert(solution.reverseList(nil) == nil)
        assert(solution.reverseList(ListNode(1))?.val == 1)
        
        var nodes: [ListNode] = []
        for i in 1...5 {
            nodes.append(ListNode(i))
        }
        for i in 0..<(nodes.count - 1) {
            nodes[i].next = nodes[i + 1]
        }
        var rList = solution.reverseList(nodes.first)
        var i = 5
        while rList != nil {
            assert(rList!.val == i)
            i-=1
            rList = rList?.next
        }
    }
    
}
