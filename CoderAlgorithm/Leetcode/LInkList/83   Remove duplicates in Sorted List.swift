//
//  83 Remove duplicates in Sorted List.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2020/2/22.
//  Copyright © 2020 HanLiu. All rights reserved.
//

import Foundation

/*
 83. 删除排序链表中的重复元素
 给定一个有序链表，删除所有重复的元素，使得每个元素只出现一次。

 示例 1:

 输入: 1->1->2
 输出: 1->2
 示例 2:

 输入: 1->1->2->3->3
 输出: 1->2->3
 
 leetCode : https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/
 */
//解法：遍历删除相同元素。  注意链表是有序链表，所以可以逐个比较
//时间复杂度：O（n），空间复杂度O（1）
func deleteDuplicates(_ head: ListNode<Int>?) -> ListNode<Int>? {
    
    var curr = head
    while curr != nil && curr?.next != nil{
        if curr?.val == curr?.next?.val {
            curr?.next = curr?.next?.next
        }else {
            curr = curr?.next
        }
    }
    return head
}

//Followup :如果不是有序链表呢？删除重复，只保留第一个出现的
//程序员面试金典 0201
//时间复杂度控制在O(n)
//解法：使用一个全局字典，递归遍历链表。空间复杂度O(n)
var dict = [Int:Int]()
func removeDuplicateNodes(_ head: ListNode<Int>?) -> ListNode<Int>? {
    if head == nil {
        return nil
    }
 
    if (dict[head!.val] == nil) {
        dict[head!.val] = 1
        head?.next = removeDuplicateNodes(head?.next)
        return head
    }else {
        return removeDuplicateNodes(head?.next)
    }
    
    //双层遍历时间z复杂度n^2,会超时
//    var dummy = ListNode(0)
//    dummy.next = head
//
//
//    var prev = head
//    var temp:ListNode<Int>? = nil
//    var curr:ListNode<Int>? = nil
//     while prev != nil {
//        temp = prev
//        curr = prev?.next
//
//        while curr != nil {
//            if prev?.val == curr?.val {
//                temp?.next = curr?.next
//            }else {
//                temp = curr
//            }
//            curr = temp?.next
//        }
//         prev = prev?.next
//     }
//    return dummy.next
}
