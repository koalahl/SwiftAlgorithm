//
//  61 Rotate LinkList.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/2/23.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation
/*
 61. 旋转链表 medium
 给定一个链表，旋转链表，将链表每个节点向右移动 k 个位置，其中 k 是非负数。

 示例 1:

 输入: 1->2->3->4->5->NULL, k = 2
 输出: 4->5->1->2->3->NULL
 解释:
 向右旋转 1 步: 5->1->2->3->4->NULL
 向右旋转 2 步: 4->5->1->2->3->NULL
 示例 2:

 输入: 0->1->2->NULL, k = 4
 输出: 2->0->1->NULL
 解释:
 向右旋转 1 步: 2->0->1->NULL
 向右旋转 2 步: 1->2->0->NULL
 向右旋转 3 步: 0->1->2->NULL
 向右旋转 4 步: 2->0->1->NULL
 **/

//解法：该题的重点在于找出新的首尾结点的位置。
//n为链表长度，新的头结点就是第n-k%n个结点
//新的尾结点就是第n-k%n-1个结点
func rotateListRight(_ head: ListNode<Int>?, _ k: Int) -> ListNode<Int>? {

    if head == nil {
        return nil
    }
    if head?.next == nil {
        return head
    }
    var old_tail = head
    var length = 1
    //遍历找到链表尾结点，并得到链表长度
    while old_tail?.next != nil {
        old_tail = old_tail?.next
        length += 1
    }
    //连接尾和头
    old_tail?.next = head
    
    //找到新的尾结点：n-k%n-1，新的头结点： n-k%n
    var new_tail = head
    var new_head:ListNode<Int>? = nil
    var i = 0
    while i < (length -  k%length - 1) {
        new_tail = new_tail?.next
        i += 1
    }
    new_head = new_tail?.next
    new_tail?.next = nil
    
    return new_head
}
