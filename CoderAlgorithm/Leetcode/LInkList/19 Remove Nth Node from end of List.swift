//
//  19 Remove Nth Node from end of List.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/2/23.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation
/*
 19. 删除链表的倒数第N个节点
 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。

 https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/
 示例：

 给定一个链表: 1->2->3->4->5, 和 n = 2.

 当删除了倒数第二个节点后，链表变为 1->2->3->5.
 说明：

 给定的 n 保证是有效的。

 进阶：

 你能尝试使用一趟扫描实现吗？**/
//
func removeNthFromEnd(_ head: ListNode<Int>?, _ n: Int) -> ListNode<Int>? {
    
    if head == nil {
        return nil
    }
    var i = 0
    let dummy = ListNode(0)
    dummy.next = head
    var prev = dummy
    var tail = dummy
    //先把tail指针移动到第n个结点
    while i < n {
        tail = tail.next!
        i += 1
    }
    //然后prev和tail指针一起往后移动
    while tail != nil && tail.next != nil {
        prev = prev.next!
        tail = tail.next!
    }
    //此时，prev所在位置就是倒数第n个结点的前一个位置. 删除结点
    prev.next = prev.next?.next
    
    return dummy.next
}
