//
//  MergeTwoSortedLists.swift
//  Algorithm-Swift
//
//  Created by TracyYih on 2018/6/19.
//  Copyright © 2018年 TracyYih. All rights reserved.
//

/***************************************************************************************************
 *
 * 输入两个单调递增的链表，输出两个链表合成后的链表，当然我们需要合成后的链表满足单调不减规则。
 *
 * 输入：1->2->4, 1->3->4
 * 输出：1->1->2->3->4->4
 *
 **************************************************************************************************/

class MergeTwoSortedLists {
    
    class ListNode {
        var val: Int
        var next: ListNode?
        init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    class Solution {
        
        // 递归方法
        func mergeTwoSortedLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
            guard let head1 = list1 else { return list2 }
            guard let head2 = list2 else { return list1 }
            
            var mList: ListNode? = nil
            if head1.val < head2.val {
                mList = head1
                mList?.next = self.mergeTwoSortedLists(head1.next, head2)
            } else {
                mList = head2
                mList?.next = self.mergeTwoSortedLists(head1, head2.next)
            }
            return mList
        }
        
    }
    
}

extension MergeTwoSortedLists: Testable {
    
    static func runTests() {
        let solution = Solution()
        assert(solution.mergeTwoSortedLists(nil, nil) == nil)
        assert(solution.mergeTwoSortedLists(ListNode(1), nil)?.val == 1)
        assert(solution.mergeTwoSortedLists(nil, ListNode(1))?.val == 1)
        assert(solution.mergeTwoSortedLists(ListNode(2), ListNode(1))?.val == 1)
        
        let list1 = ListNode(1)
        list1.next = ListNode(2)
        list1.next?.next = ListNode(4)
        
        let list2 = ListNode(1)
        list2.next = ListNode(3)
        list2.next?.next = ListNode(4)
        
        let list = solution.mergeTwoSortedLists(list1, list2)
        assert(list?.val == 1)
        assert(list?.next?.val == 1)
        assert(list?.next?.next?.val == 2)
        assert(list?.next?.next?.next?.val == 3)
        assert(list?.next?.next?.next?.next?.val == 4)
        assert(list?.next?.next?.next?.next?.next?.val == 4)
    }
    
}
