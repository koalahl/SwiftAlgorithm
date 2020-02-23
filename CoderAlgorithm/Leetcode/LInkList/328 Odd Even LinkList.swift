//
//  328 Odd Even LinkList.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/2/23.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation

/*
 328. 奇偶链表  medium
 给定一个单链表，把所有的奇数节点和偶数节点分别排在一起。请注意，这里的奇数节点和偶数节点指的是节点编号的奇偶性，而不是节点的值的奇偶性。

 请尝试使用原地算法完成。你的算法的空间复杂度应为 O(1)，时间复杂度应为 O(nodes)，nodes 为节点总数。

 示例 1:

 输入: 1->2->3->4->5->NULL
 输出: 1->3->5->2->4->NULL
 示例 2:

 输入: 2->1->3->5->6->4->7->NULL
 输出: 2->3->6->7->1->5->4->NULL
 
 https://leetcode-cn.com/problems/odd-even-linked-list/
 
 时间复杂度： O(n) 。总共有 nn 个节点，我们每个遍历一次。
 空间复杂度： O(1) 。我们只需要 4 个指针。
 
 解法：分别构造两个奇偶链表，遍历到尾部，然后连接奇数链表到尾和偶数链表到头
 **/
func oddEvenList(_ head: ListNode<Int>?) -> ListNode<Int>? {
    
    var odd = head
    var even = head?.next , evenHead = head?.next
    
    while even != nil && even?.next != nil {
        odd?.next = even?.next
        odd = even?.next
        even?.next = odd?.next
        even = odd?.next
    }
    odd?.next = evenHead
    return head
}
