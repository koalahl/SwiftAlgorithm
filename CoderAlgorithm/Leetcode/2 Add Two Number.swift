//
//  2 Add Two Number.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2019/5/15.
//  Copyright © 2019 HanLiu. All rights reserved.
//

import Foundation
/*
 Leetcode: 2. 两数相加
 Link: https://leetcode-cn.com/problems/add-two-numbers/

 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 示例：
 
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
/// swift的解法的思想还是采用递归
public func addTwoNumbers(_ l1: ListNode<Int>?, _ l2: ListNode<Int>?) -> ListNode<Int>? {
    guard let l1 = l1 else { return l2 }
    guard let l2 = l2 else { return l1 }
    //创建一个新的链表，初始值设置为两个链表第一个元素的和，并且取余
    let outputNode = ListNode((l1.val+l2.val)%10)
    //如果和大于10，则进位。即下一次相加时多加个1.
    if l1.val + l2.val > 9 {
        outputNode.next = addTwoNumbers(addTwoNumbers(l1.next, l2.next), ListNode(1))
    }else {
        outputNode.next = addTwoNumbers(l1.next, l2.next)
    }

    return outputNode
}


