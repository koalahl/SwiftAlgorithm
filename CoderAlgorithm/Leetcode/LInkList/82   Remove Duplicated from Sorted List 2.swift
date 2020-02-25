//
//  82 Remove Duplicated from Sorted List 2.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/2/23.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation
/*
 82. 删除排序链表中的重复元素 II
 Medium
 给定一个排序链表，删除所有含有重复数字的节点，只保留原始链表中 没有重复出现 的数字。

 示例 1:

 输入: 1->2->3->3->4->4->5
 输出: 1->2->5
 示例 2:

 输入: 1->1->1->2->3
 输出: 2->3
 
 **/
//解法：需要标记，构造一个内层循环
func deleteDuplicatesAll(_ head: ListNode<Int>?) -> ListNode<Int>? {
    
    if head == nil {
        return nil
    }
    let dummy = ListNode(0)
    dummy.next = head
    var curr = dummy
    
    while curr.next != nil && curr.next?.next != nil {
        
        if curr.next?.val == curr.next?.next?.val {
            var temp = curr.next
            while temp != nil && temp?.next != nil && temp?.val == temp?.next?.val {
                temp = temp?.next
            }
            curr.next = temp?.next
        }else {
            curr = (curr.next)!
        }
    }
    //dummy结点为什么变了？答案：dummy结点本身地址没有变，变得是next指针，因为curr.next改变了，就是指针改变了
    return dummy.next
}
