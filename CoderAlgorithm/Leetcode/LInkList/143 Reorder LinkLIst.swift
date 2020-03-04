//
//  143 Reorder LinkLIst.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/2/25.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation

/**
143. 重排链表

给定一个单链表 L：L0→L1→…→Ln-1→Ln ，
将其重新排列后变为： L0→Ln→L1→Ln-1→L2→Ln-2→…
你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

 
 示例 1:
 给定链表 1->2->3->4, 重新排列为 1->4->2->3.


 
 示例 2:
 给定链表 1->2->3->4->5, 重新排列为 1->5->2->4->3.

https://leetcode-cn.com/problems/reorder-list

解法一：使用分隔链表，反转链表，再组合到一起
时间复杂度：O（n），空间复杂度：O（1）
**/
func reorderList(_ head: ListNode<Int>?) -> ListNode<Int>? {
    if head == nil {
        return nil
    }
    var prev:ListNode<Int>? = nil
    //注意这里 两个指针都指向head。 区别于141判断链表是否有环的快慢指针是一前一后。
    var slow = head
    var fast = head
    //1.分隔 使用快慢指针将链表分隔成两段，链表的奇偶不影响分隔。 链表的中间节点：第n/2个 奇数个时，中间节点会成为后半段的头结点
    while fast != nil && fast?.next != nil {
        prev = slow
        slow = slow?.next
        fast = fast?.next?.next
    }
    //最后第一段链表尾就是prev
    prev?.next = nil
    //2.反转 第二段链表的头就是最后slow位置的结点
    var h2 = reverseList(slow)
    
    //3.拼接
    let dummy = ListNode(0)
    var newList = dummy
    var h1 = head
    while h1 != nil && h2 != nil && h1 !== h2{
        newList.next = h1
        h1 = h1?.next
        
        newList.next?.next = h2
        h2 = h2?.next
        
        newList = (newList.next?.next)!
    }
    
    return dummy.next
    
}
