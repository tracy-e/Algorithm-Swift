//
//  FindKthToTail.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/17.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 输入一个链表，输出该链表中倒数第k个结点。
 *
 **************************************************************************************************/

class FindKthToTail {
    
    class ListNode {
        var val: Int
        var next: ListNode?
        init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    class Solution {
        
        func findKthToTail(head: ListNode, k: Int) -> ListNode? {
            guard k > 0 else {
                return nil
            }
            var ahead = head
            for _ in 0..<(k - 1) {
                if let next = ahead.next {
                    ahead = next
                } else {
                   return nil
                }
            }
            var behind = head
            while ahead.next != nil {
                ahead = ahead.next!
                behind = behind.next!
            }
            return behind
        }
        
    }
    
}

extension FindKthToTail: Testable {
    
    static func runTests() {
        let solution = Solution()
        assert(solution.findKthToTail(head: ListNode(1), k: 0) == nil)
        assert(solution.findKthToTail(head: ListNode(1), k: 1)?.val == 1)
        
        var nodes: [ListNode] = [1, 2, 3, 4, 5, 6].map { ListNode($0) }
        for i in 0..<(nodes.count - 1) {
            nodes[i].next = nodes[i+1]
        }
        assert(solution.findKthToTail(head: nodes.first!, k: 3)?.val == 4)
    }
    
}
