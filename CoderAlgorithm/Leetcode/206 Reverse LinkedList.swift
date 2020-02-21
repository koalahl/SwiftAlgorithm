//
//  206 Reverse LinkedList.swift
//  CoderAlgorithm
//
//  Created by HanLiu on 2019/12/15.
//  Copyright © 2019 HanLiu. All rights reserved.
//

import Foundation

/// 反转链表
/// - https://leetcode-cn.com/problems/reverse-linked-list/solution/fan-zhuan-lian-biao-by-leetcode/
/// - 时间复杂度：O(n)
/// - 空间复杂度：O(1)
/// - 重点是遍历链表的过程中，改变next指向
/// - Parameter head: 链表头节点
public func reverseList(_ head: ListNode<Int>?) -> ListNode<Int>? {
    var prev:ListNode<Int>? = nil
    var curr = head
    //遍历链表的过程中，改变next指向
    while curr != nil {
        let tmpNode = curr?.next//先保存起来
        curr?.next = prev//改变指向
        //下一个
        prev = curr
        curr = tmpNode
    }
    //注意这里是返回 prev
    return prev
}

/// 反转链表，使用递归方式
/// - 时间复杂度：O(n)，假设 n 是列表的长度，那么时间复杂度为 O(n)。
/// - 空间复杂度：O(n)，由于使用递归，将会使用隐式栈空间。递归深度可能会达到 n层。

public func reverseListRecursive<T>(_ head: ListNode<T>?) -> ListNode<T>? {
    guard let h = head, let next = h.next else {
        return head
    }
    let node = reverseListRecursive(next)
    next.next = h
    h.next = nil
    return node
}
