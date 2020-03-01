//
//  234palindromeLinkedList.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2019/12/15.
//  Copyright © 2019 HanLiu. All rights reserved.
//

import Foundation

///234. 回文链表
/*
 请判断一个链表是否为回文链表。
 
 示例 1:

 输入: 1->2
 输出: false
 示例 2:

 输入: 1->2->2->1
 输出: true
 
 进阶：
 你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/palindrome-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func isPalindrome(_ head: ListNode<Int>?) -> Bool {
//    return isPalindomeUseArray(head)
    return isPalindromeLegacy(head)
}
//解法一：复制链表元素到数组中，然后使用双指针法判断数组中的元素是否为回文
//时间复杂度：O(n), 空间复杂度：O(n)：额外用到了一个数组
func isPalindomeUseArray(_ head: ListNode<Int>?) -> Bool {
    if head == nil  {
        return true
    }

    var curr = head
    var tempArr:[Int] = []
    //1.将链表元素加入到数组中
    while curr != nil {
        tempArr.append(curr!.val)
        curr = curr?.next
    }
    //2.首尾index遍历比较数组元素
    var prev = 0
    var tail = tempArr.count-1
    while prev < tail {
        if tempArr[prev] != tempArr[tail] {
            return false
        }
        prev += 1
        tail -= 1
    }
    
    return true
}

//解法二：分割链表为两部分，依次判断两部分链表每个值
//时间复杂度 O（n），空间复杂度O（1）
func isPalindromeLegacy(_ head:ListNode<Int>?) -> Bool {
    if head == nil  {
        return true
    }
    
    //找到前半部分链表的尾结点,
    var slow = head , fast = head
    while fast?.next != nil && fast!.next?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    let firstHalfEndNode:ListNode<Int>? = slow
    //反转后半部分链表,并返回起始节点
    let secondHalfStartNode:ListNode<Int>? = reverseList(firstHalfEndNode?.next)
    
    //比较两个链表,判断是否回文
    var p1 = head
    var p2 = secondHalfStartNode
    while p2 != nil {
        if (p1?.val != p2?.val) {
            return false
        }
        p1 = p1?.next
        p2 = p2?.next
    }
    //还原链表
    firstHalfEndNode?.next = reverseList(secondHalfStartNode)
    
    return true
}

