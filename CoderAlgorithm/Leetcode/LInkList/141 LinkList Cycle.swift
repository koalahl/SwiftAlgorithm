//
//  141 LinkList Cycle.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/2/25.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation

/**
 141. 环形链表
 给定一个链表，判断链表中是否有环。

 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
 
 示例 1：
 输入：head = [3,2,0,-4], pos = 1
 输出：true
 解释：链表中有一个环，其尾部连接到第二个节点。


 示例 2：
 输入：head = [1,2], pos = 0
 输出：true
 解释：链表中有一个环，其尾部连接到第一个节点。


 示例 3：
 输入：head = [1], pos = -1
 输出：false
 解释：链表中没有环。

 进阶：
 你能用 O(1)（即，常量）内存解决此问题吗？
 
 解法一：字典，存储元素. 时间复杂度和空间复杂度都是O(n)
 
 解法二：快慢指针, 时间复杂度O(n),空间复杂度O(1)
 **/
func hasCycle(_ head:ListNode<Int>?) -> Bool {

    if head == nil || head?.next == nil {
        return false
    }
    var slow = head
    var fast = head?.next
    while slow !== fast {
        if fast == nil && fast?.next == nil {
            return false
        }
        slow = slow?.next
        fast = fast?.next?.next
    }
    return true
}

func hasCycle2(_ head:ListNode<Int>?) -> Bool {

    if head == nil || head?.next == nil {
        return false
    }
    var slow = head
    var fast = head
    while fast !== nil && fast?.next !== nil {
        slow = slow?.next
        fast = fast?.next?.next
        if slow === fast {
            return true
        }
    }
    return false
}
/* java 版本：
public boolean hasCycle(ListNode head) {
    if (head == null || head.next == null) {
        return false;
    }
    ListNode slow = head;
    ListNode fast = head.next;
    while (slow != fast) {
        if (fast == null || fast.next == null) {
            return false;
        }
        slow = slow.next;
        fast = fast.next.next;
    }
    return true;
}
 
 public boolean hasCycle(ListNode head) {
     Set<ListNode> nodesSeen = new HashSet<>();
     while (head != null) {
         if (nodesSeen.contains(head)) {
             return true;
         } else {
             nodesSeen.add(head);
         }
         head = head.next;
     }
     return false;
 }

 作者：LeetCode
 链接：https://leetcode-cn.com/problems/linked-list-cycle/solution/huan-xing-lian-biao-by-leetcode/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
*/
