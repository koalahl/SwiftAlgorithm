//
//  21 Merge Two Sorted LinkList.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/2/28.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation
/**
 21. 合并两个有序链表
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

 示例：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 
 https://leetcode-cn.com/problems/merge-two-sorted-lists/
 解法：新建一个链表，逐一比较两个链表，较小的插入到新的链表中
 时间复杂度：O（n），空间复杂度O（1）
 */
func mergeTwoLists(_ l1: ListNode<Int>?, _ l2: ListNode<Int>?) -> ListNode<Int>? {

    if l1 == nil {
        return l2
    }
    if l2 == nil {
        return l1
    }
    
    var pt1 = l1
    var pt2 = l2
    
    let dummy = ListNode(0)
    var curr = dummy
    while pt1 != nil && pt2 != nil {
        if pt1!.val < pt2!.val {
            curr.next = pt1
            pt1 = pt1?.next
        }else {
            curr.next = pt2
            pt2 = pt2?.next
        }
        curr = curr.next!
    }
    curr.next = (pt1 != nil) ? pt1 : pt2
    
    return dummy.next
}
